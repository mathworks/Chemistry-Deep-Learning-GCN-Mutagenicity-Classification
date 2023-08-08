from rdkit import Chem
import collections
from collections import defaultdict

mol = Chem.MolFromSmiles(x)
atomic_count = defaultdict(lambda : 0)
for atom in mol.GetAtoms():
     atomic_count[atom.GetAtomicNum()] += 1
NumAtms = atomic_count
print(atomic_count)





















