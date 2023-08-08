function Graph_from_SMILES_Dataset(SMILES_Data,Class)

% Construct adjacency matrix for molecular graph
% We now convert the generated molecule object to pdb block. 
% This allows us to easily use the CONECT records to construct the adjacency matric of the molecular graph object in MATLAB. 
% Make sure that set the path correctly (in the python file) that the generated pdb file is stored. 


% First we need to find out the size of the biggest molecule so that the
% graph matrix suze is set to that. The biggest molecule has 132 atoms. We
% set the graph matrix size to 250 (smaller number causes some problems in
% reading the pdb files).

     for molIdx = 1:length(SMILES_Data) 
         SMILES = SMILES_Data{molIdx}; 
         NumAtoms = pyrunfile("GetNumAtoms.py","numatom",x=SMILES);
         AtmCount(molIdx) = int64(NumAtoms);
     end
         MaxNumAtms = max(AtmCount)   % This should be 214 atoms in Molecules in AMES
  

          MatrixSize = 214;
          Nodemat = zeros(MatrixSize,7);
          labels = Class;

  for molIdx = 1:length(SMILES_Data) 
      SMILES = SMILES_Data{molIdx}; 

  pdbout = pyrunfile("MolToPDBBlock.py","molpdb",x=SMILES);
  pdbfile = string(pdbout);

  % This MATLAB function reads the pdb file and constructs the corresponding adjacency matrix.

  Adj = pdbToADJ_Data(pdbfile,MatrixSize);
  Adjmat(:,:,molIdx) = Adj;

  % Construct node feature matrix for molecular graph
  % The following function extract seven atomic features from the above given SMILES structure. 
  % The node/feature matrix include: 
  % atomic number, atomic mass, total atomic valance, atomic degree, number of hydrogens connected to the atom,
  % atomic hybridization ("sp",  sp2 , “sp3”), and whether the atom belongs to an aromatic ring. 

  NodeData = pyrunfile("GetNodeFeaturesMatrix.py","nodedat",x=SMILES);
  Nodefile = string(NodeData);
  nodefeat = dlmread('NodeFeaturesMatrix.dat');
  nodefeat_size = size(nodefeat);
  rowsize=nodefeat_size(1,:);
  pad = MatrixSize-rowsize(1);
  padnode = padarray(nodefeat,[pad,0],0,'post');
  Nodemat(:,:,molIdx) = padnode;
  %Nodemat(:,:,molIdx) = padarray(nodefeat,MatrixSize);

  % Construct and visualize molecular graph
  % Now that we have both the adjacency and feature matrices, 
  % we can use MATLAB graph function to build the moecular graph and plot it.
  
  graphfilename = ['AMES_Data_5','.mat'];
  save(graphfilename,"Adjmat","Nodemat","labels");

  end
  
  disp([graphfilename,'is saved successfully' ]);

end