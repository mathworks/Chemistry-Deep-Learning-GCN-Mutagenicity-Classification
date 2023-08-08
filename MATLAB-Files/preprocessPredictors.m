function [adjacency,features] = preprocessPredictors(adjacencyData,coulombData)

% Preprocess Predictors Function
% The preprocessPredictors function preprocesses the adjacency and Coulomb matrices using the following steps:
% For each molecule:
% Extract the unpadded data.
% Extract the feature vector from the diagonal of the unpadded Coulomb matrix.
% Append the extracted data to the output arrays.
% For the adjacency matrix input, the GCN requires a single sparse block-diagonal matrix containing each of the adjacency matrices, 
% where each block corresponds to the adjacency matrix of one graph instance. 
% To append data to the block-diagonal matrix, the function uses the blkdiag function.

adjacency = sparse([]);
features = [];

for i = 1:size(adjacencyData, 3)
    % Extract unpadded data.
    numNodes = find(any(adjacencyData(:,:,i)),1,"last");

    A = adjacencyData(1:numNodes,1:numNodes,i);
    X = coulombData(1:numNodes,1:numNodes,i);

    % Extract feature vector from diagonal of Coulomb matrix.
    X = diag(X);

    % Append extracted data.
    adjacency = blkdiag(adjacency,A);
    features = [features; X];
end

end