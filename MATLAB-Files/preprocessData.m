
function [adjacency, features, labels, numAtoms] = preprocessData(adjacencyData, featureData, labelData)
    
    adjacency = sparse([]);
    features = [];
    labels = [];
    numAtoms = [];
    atomicNumber = featureData;


   % disp('-------------featureData in preprocessData ------------')
   % size(featureData)
    
    for i = 1:size(adjacencyData, 3)
        % Remove padded zeros from atomicNumber
      
         atomicNumber(:,i) = featureData(:,1,i); % when 7 features
        %atomicNumber(:,i) = featureData(:,i); % when 1 features

   %     disp('-------------atomicNumber ------------')
   %     size(atomicNumber)

        atoms = nonzeros(atomicNumber(:,i));
        numAtoms = [numAtoms;numel(atoms)];

        tmpLabels = labelData(:,i);
        tmpLabels(tmpLabels=="") = [];
        labels = [labels; tmpLabels];

        % Get the indices of the un-padded data
        validIdx = 1:numel(atoms);

        % Use the indices for un-padded data to remove padded zeros
        % from the adjacency data
        tmpAdjacency = adjacencyData(validIdx, validIdx, i);

        % Build the adjacency matrix into a block diagonal matrix
        adjacency = blkdiag(adjacency, tmpAdjacency);

        % Remove padded zeros from node features and extract the
        % feature array
      
        tmpFeatures = featureData(validIdx,:,i);  % When 7 features
       % tmpFeatures = featureData(validIdx,i);  % When 1 feature

        
        features = [features; tmpFeatures];

      %  disp('-------------features in preprocessData ------------')
      %  size(features)

    end

    labels = categorical(labels);

end

