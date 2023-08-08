function features = normalizeFeatures(features)

% Get the mean and variance from the training data
meanFeatures = mean(features{1});
varFeatures = var(features{1}, 1);

% Standardize training, validation and test data
for i = 1:numel(features) %3
    features{i} = (features{i} - meanFeatures)./sqrt(varFeatures);
end

end