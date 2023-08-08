
function [SMILES_Data,NR_SR] = ImportTox21(filename)


% Part 1: Reading in the SMILES structures:
tox21 = readtable(filename);
SMILES_Data = string(tox21{:,1});  % 14 is the column index where SMILES are stored in "tox21.csv". Adjust accordingly when working with other datasets.
%tox21_SMILES = tox21_SMILES{1:end,'smiles'};
%NumMols = size(tox21_SMILES,1);  % There are 7831 molecules in this dataset
%SMILES_Data = string(tox21_SMILES);

% Part 2: Reading in the NR-SR Toxicity assays
NR_SR = tox21(:,2);  % 14 is the columns 1-12 have the NR and SR Assyas.

end