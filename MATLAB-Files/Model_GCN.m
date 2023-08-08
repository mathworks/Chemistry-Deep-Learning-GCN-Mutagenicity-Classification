
function dlY = Model_GCN(dlX, A,numAtoms, parameters)

% Normalize adjacency matrix

L = NormalizeAdjacency(A);


Z1 = dlX;

Z2 = L * Z1 * parameters.W1;
Z2 = relu(Z2); % + Z1;  % Try by removing + Z1

Z3 = L * Z2 * parameters.W2;
Z3 = relu(Z3) + Z2;  % Try by removing Z2

Z4 = L * Z3 * parameters.W3; 
Z4 = relu(Z4);


%Z4 = L * Z3 * parameters.W3; 
%Z4 = relu(Z4);

% a = [0;cumsum(numAtoms)];
% avgZ4 = zeros(numel(numAtoms),size(Z4,2),'like',Z4);

% for ii = 1:numel(a)-1
%     avgZ4(ii,:) = sum(Z4(a(ii)+1:a(ii+1),:))./numAtoms(ii);
% end
% dlY = softmax(avgZ4, 'DataFormat', 'BC');


   Z5 = GlobalAveragePool(Z4,numAtoms);
   dlY = softmax(Z5, 'DataFormat', 'BC');
  % dlY = sigmoid(Z6);

end