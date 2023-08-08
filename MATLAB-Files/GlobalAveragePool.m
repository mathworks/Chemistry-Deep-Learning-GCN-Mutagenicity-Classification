function outFeatures = GlobalAveragePool(inFeatures,numNodes)
numGraphs = numel(numNodes);
numFeatures = size(inFeatures, 2);
outFeatures = zeros(numGraphs,numFeatures,'like',inFeatures);
startIdx = 1;
for i = 1:numGraphs
    endIdx = startIdx + numNodes(i) - 1;
    idx = startIdx:endIdx;
    outFeatures(i,:) = mean(inFeatures(idx,:));
    startIdx = endIdx + 1;
end
end