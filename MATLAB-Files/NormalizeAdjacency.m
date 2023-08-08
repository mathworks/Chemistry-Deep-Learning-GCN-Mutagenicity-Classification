
function normAdjacency = NormalizeAdjacency(adjacency)

% Add self connections to adjacency matrix
adjacency = adjacency + speye(size(adjacency));

% Compute degree of nodes
degree = sum(adjacency, 2);

% Compute inverse square root of degree
degreeInvSqrt = sparse(sqrt(1./degree));

% Normalize adjacency matrix
normAdjacency = diag(degreeInvSqrt) * adjacency * diag(degreeInvSqrt);

end