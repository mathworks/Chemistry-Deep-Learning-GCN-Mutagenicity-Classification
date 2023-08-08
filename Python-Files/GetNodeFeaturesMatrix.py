from rdkit import Chem

mol = Chem.MolFromSmiles(x)

#https://python.hotexamples.com/examples/ase/Atoms/copy/python-atoms-copy-method-examples.html

atoms = mol.GetAtoms()

f = open("NodeFeaturesMatrix.dat", "w")
#f.write("{0} atoms\n".format(len(numatom)))  # Identify number of atoms

atom_index = {}
for i, atom in enumerate(atoms):
    sym = atom.GetSymbol
    atom_index[sym] = [i + 1]

#f.write("{0} atom types\n".format(len(atom_index)))  # Number of atom types
#f.write("{0} atom types\n".format(len(npnumatom)))  # Number of atom types


#f.write("Atoms\n\n")
for i, atom in enumerate(atoms):
 #   atomSym = atom.GetSymbol()
    atomNum = atom.GetAtomicNum()
    atomMass = atom.GetMass()
    atomVal = atom.GetTotalValence()
    atomDeg = atom.GetDegree()
    atomHs = atom.GetNumImplicitHs()  # same as totalHs
    atomHyb = atom.GetHybridization()-1
    atomAromat = atom.GetIsAromatic()+0  # 0 is False,  ;  1 is True
   # print(atom.GetSymbol(),atom.GetAtomicNum(),atom.GetMass(),atom.GetTotalValence(),atom.GetDegree(),atom.GetNumImplicitHs(),atom.GetHybridization()-1,atom.GetIsAromatic()+0)
  #  nodematrix = print(atom.GetSymbol(),atom.GetAtomicNum(),atom.GetMass(),atom.GetTotalValence(),atom.GetDegree(),atom.GetNumImplicitHs(),atom.GetHybridization()-1,atom.GetIsAromatic()+0)

#    f.write("{0} {1} {2} {3} {4} {5} {6} {7} {8}\n".format(i + 1, atom_index[sym][0], atomNum, atomMass, atomVal, atomDeg, atomHs, atomHyb, atomAromat))
  
    
    f.write("{0} {1} {2} {3} {4} {5} {6}\n".format(atomNum, atomMass, atomVal, atomDeg, atomHs, atomHyb, atomAromat))
f.close()

nodedat = "NodeFeaturesMatrix.dat"












