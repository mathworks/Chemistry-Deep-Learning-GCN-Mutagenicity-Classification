function [Adjacency,Features,Labels,classes,numOutputFeatures,numAtoms] = Partition_and_Prepare(Adjacency,FeaturesIn,Labels,Partitions)

% disp('-------------Size FeaturesIn ------------')
% size(FeaturesIn)

[adjacencyDataSplit, featureDataSplit, labelSplit] = splitData(Adjacency, FeaturesIn, Labels,Partitions);

% disp('-------------Size featuresDataSplit from SplitData ------------')
% size(featureDataSplit{1})

[Adjacency, FeaturesOut, Labels, numAtoms] = cellfun(@preprocessData, adjacencyDataSplit, featureDataSplit, labelSplit,'UniformOutput', false);

% disp('--------------Size FeaturesOut from preprocessData ------------')
% size(FeaturesOut{1})

Features = normalizeFeatures(FeaturesOut);



% disp('--------------Size Features from Normalization ------------')
% size(Features{1})


classes = categories(cat(1,Labels{:}));  %  {'Positive', 'Negative'}; 
numOutputFeatures = numel(classes);



end



