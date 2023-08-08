from rdkit import Chem
from rdkit.Chem import Draw

mol = Chem.MolFromSmiles(x)
mol0 = "Molecule.png"
Draw.MolToFile(mol, mol0)
















