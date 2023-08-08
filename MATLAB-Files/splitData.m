
function [adjacencyDataSplit, featureDataSplit, labelDataSplit] = splitData(adjacencyData, featureData, labelData,Partitions)

    adjacencyDataSplit = cell(1,3);
    featureDataSplit = cell(1,3);
    labelDataSplit = cell(1,3);
    numMolecules = size(adjacencyData, 3);

    % Set initial random state for example reproducibility.
 %   rng(0);

    % Get training data
    idx = randperm(size(adjacencyData, 3), floor(Partitions(1)*numMolecules));
    adjacencyDataSplit{1} = adjacencyData(:,:,idx);
    featureDataSplit{1} = featureData(:,:,idx);  % 7 consider features
 %   featureDataSplit{1} = featureData(:,idx);   % consider only one feature
    labelDataSplit{1} = labelData(:,idx);
    adjacencyData(:,:,idx) = [];
    featureData(:,:,idx) = [];   % 7 consider features
 %   featureData(:,idx) = [];   % consider only one feature
    labelData(:,idx) = [];

    % Get validation data
    idx = randperm(size(adjacencyData, 3), floor(Partitions(2)*numMolecules));
    adjacencyDataSplit{2} = adjacencyData(:,:,idx);
    featureDataSplit{2} = featureData(:,:,idx);   % 7 consider features
 %    featureDataSplit{2} = featureData(:,idx);  % consider only one feature
    labelDataSplit{2} = labelData(:,idx);
    adjacencyData(:,:,idx) = [];
    featureData(:,:,idx) = [];  % 7 consider features
%    featureData(:,idx) = [];  % consider only one feature
    labelData(:,idx) = [];

    % Get test data
    adjacencyDataSplit{3} = adjacencyData;
    featureDataSplit{3} = featureData;
    labelDataSplit{3} = labelData;

end