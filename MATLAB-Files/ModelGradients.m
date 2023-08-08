
function [gradients, loss, dlYPred] = ModelGradients(dlX, adjacencyTrain,numAtoms, T, parameters)

    dlYPred = Model_GCN(dlX, adjacencyTrain, numAtoms,parameters);

  %  cat(2,dlYPred,T)

    loss = crossentropy(dlYPred, T, 'DataFormat', 'BC');
    gradients = dlgradient(loss, parameters);
  
end