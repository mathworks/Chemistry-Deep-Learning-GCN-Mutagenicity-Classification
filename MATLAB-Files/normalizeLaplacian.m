
function [LNorm] = normalizeLaplacian(L,A)

% Normalize Laplacian matrix
% The normalizeLaplacian function takes as input the Laplacian matrix L of graph G and returns the normalized adjacency matrix D^-1/2.L.D^-1/2,
% I_N is the identity matrix, and D is the degree matrix of A.

% Compute inverse square root of degree.
degree = sum(A, 2);
degreeInvSqrt = sparse(sqrt(1./degree));

% Normalize adjacency matrix.
LNorm = diag(degreeInvSqrt) * L * diag(degreeInvSqrt);

end