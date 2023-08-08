
function Test_GCN(adjacency, features, labels,params,options,numOutputFeatures,classes,numAtoms,parameters)

numHiddenFeatureMaps = params(1);
numEpochs = params(2);
learnRate = params(3);
validationFrequency = params(4);
plots = options(1);
executionEnvironment = options(2);


% Test Model
featureTest = features{3};
adjacencyTest = adjacency{3};
targetTest = labels{3};
numAtomsTest = numAtoms{3};
dlXTest = dlarray(featureTest);
dlYPredTest = Model_GCN(dlXTest, adjacencyTest, numAtomsTest, parameters);
[scoreTest, predTest] = Accuracy(dlYPredTest, targetTest, classes);

%% Visualize Predictions
numOfSamples = numel(targetTest);
classTarget = zeros(numOfSamples, numOutputFeatures);
classPred = zeros(numOfSamples, numOutputFeatures);
for i = 1:numOutputFeatures
    classTarget(:,i) = targetTest==categorical(classes(i));
    classPred(:,i) = predTest==categorical(classes(i));
end

% Compute class-wise accuracy score
classAccuracy = sum(classPred == classTarget)./numOfSamples;

% Visualize class-wise accuracy score
figure
[~,idx] = sort(classAccuracy,'descend');
histogram('Categories',classes(idx), ...
    'BinCounts',classAccuracy(idx), ...
    'Barwidth',0.8)
xlabel("Category")
ylabel("Accuracy")
title("Class Accuracy Score")

[confusionMatrix, order] = confusionmat(targetTest, predTest);
figure
cm = confusionchart(confusionMatrix, classes, ...
    'ColumnSummary','column-normalized', ...
    'RowSummary','row-normalized', ...
    'Title', 'GCN Mutagenicity Classification Confusion Chart');
end