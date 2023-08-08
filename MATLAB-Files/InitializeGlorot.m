
function weights = InitializeGlorot(numIn, numOut)

    varWeights = sqrt( 2 / (numIn + numOut) );
    weights = varWeights * (2 * rand([numIn, numOut]) - 1);

end