
function [parameters] = Train_GCN(adjacency, features, labels, params,options,numOutputFeatures,classes,numAtoms)

numHiddenFeatureMaps = params(1);
numEpochs = params(2);
class(numEpochs);
learnRate = params(3);
validationFrequency = params(4);
plots = options(1);
executionEnvironment = options(2);


 % Arrange data into training, validation, and test sets 
featureTrain = features{1};

% disp('-------- featureTrain ------------')
% size(featureTrain)

adjacencyTrain = adjacency{1};
targetTrain = labels{1};
numAtomsTrain = numAtoms{1};

featureValidation = features{2};
adjacencyValidation = adjacency{2};
targetValidation = labels{2};
numAtomsValidation = numAtoms{2};

% Initialize Model Parameters
numInputFeatures = size(featureTrain,2);


parameters.W1 = dlarray(InitializeGlorot(numInputFeatures, numHiddenFeatureMaps));
parameters.W2 = dlarray(InitializeGlorot(numHiddenFeatureMaps, numHiddenFeatureMaps));
parameters.W3 = dlarray(InitializeGlorot(numHiddenFeatureMaps, numOutputFeatures));

%% Train Model

if plots == "training-progress"
    figure
    
    % Accuracy.
    subplot(2,1,1)
    lineAccuracyTrain = animatedline('Color',[0 0.447 0.741]);
    lineAccuracyValidation = animatedline( ...
        'LineStyle','--', ...
        'Marker','o', ...
        'MarkerFaceColor','black');
    ylim([0 1])
    xlabel("Epoch")
    ylabel("Accuracy")
    grid on
    
    % Loss.
    subplot(2,1,2)
    lineLossTrain = animatedline('Color',[0.85 0.325 0.098]);
    lineLossValidation = animatedline( ...
        'LineStyle','--', ...
        'Marker','o', ...
        'MarkerFaceColor','black');
    ylim([0 inf])
    xlabel("Epoch")
    ylabel("Loss")
    grid on
end

trailingAvg = [];
trailingAvgSq = [];

dlX = dlarray(featureTrain);
dlXValidation = dlarray(featureValidation);

if (executionEnvironment == "auto" && canUseGPU) || executionEnvironment == "gpu"
    dlX = gpuArray(dlX);
end

T = onehotencode(targetTrain, 2, 'ClassNames', classes);
TValidation = onehotencode(targetValidation, 2, 'ClassNames', classes);

start = tic;
% Loop over epochs.
for epoch = 1:numEpochs
    
    % Evaluate the model gradients and loss using dlfeval and the
    % ModelGradients function.
    [gradients, loss, dlYPred] = dlfeval(@ModelGradients, dlX, adjacencyTrain, numAtomsTrain, T, parameters);
    
    % Update the network parameters using the Adam optimizer.
    [parameters,trailingAvg,trailingAvgSq] = adamupdate(parameters,gradients, ...
        trailingAvg,trailingAvgSq,epoch,learnRate);
    
    % Display the training progress.
    if plots == "training-progress"
        subplot(2,1,1)
        D = duration(0,0,toc(start),'Format','hh:mm:ss');
        title("Epoch: " + epoch + ", Elapsed: " + string(D))

        % Loss.
        addpoints(lineLossTrain,epoch,double(gather(extractdata(loss))))

        % Accuracy score.
        score = Accuracy(dlYPred, targetTrain, classes);
        addpoints(lineAccuracyTrain,epoch,double(gather(score)))

        drawnow

        % Display validation metrics.
        if epoch == 1 || mod(epoch,validationFrequency) == 0
            % Loss.
            dlYPredValidation = Model_GCN(dlXValidation, adjacencyValidation, numAtomsValidation, parameters);
            lossValidation = crossentropy(dlYPredValidation, TValidation, 'DataFormat', 'BC');
            addpoints(lineLossValidation,epoch,double(gather(extractdata(lossValidation))))

            % Accuracy score.
            scoreValidation = Accuracy(dlYPredValidation, targetValidation, classes);
            addpoints(lineAccuracyValidation,epoch,double(gather(scoreValidation)))

            drawnow
        end
    end
end

end