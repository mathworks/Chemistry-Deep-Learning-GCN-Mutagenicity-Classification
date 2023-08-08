from rdkit import Chem
from rdkit.Chem import AllChem
from inspect import getfile
from pathlib import Path


mol = Chem.MolFromSmiles(x)
mh = Chem.AddHs(mol)
AllChem.EmbedMolecule(mh)
pdbblock = Chem.MolToPDBBlock(mh)

script_path = getfile(lambda: None)
print(script_path)
parent_path = Path(script_path).parent
print(parent_path)

open(parent_path/'pdbformat_AMES.pdb', 'w').write(Chem.MolToPDBBlock(mh, flavor=4));

molpdb = "pdbformat_AMES.pdb"















