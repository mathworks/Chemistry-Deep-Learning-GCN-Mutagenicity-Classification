
function [Adjacency,Features,Labels] = Concatenate_Data(GraphDataFolder)

Adjacency = zeros(214,214,0);
Features = zeros(214,7,0);    % Consider all 7 features
%  Features = zeros(250,0);    % Consider only the first one (atomic number)
 Labels = cell(1,0);
 toxmols = 0;
 nontoxmols = 0;

% RandLabelFolder = 'Random_Labels'; Uncomment if using random labels




% Note for Below:
% "tox21_Dec_Graph_0.mat" is 3000 Negative Structures
% "tox21_Dec_Graph_1.mat" is 1658 Positive Structures

for S = 0:5
        filename = ['AMES_Data','_',num2str(S),'.mat'];
        dataFile = fullfile(GraphDataFolder,filename);
        load(dataFile);
       [binarylabels,numtox,numnontox] = BinaryLabels(labels); % comment
    %    out if using random labels

     %   RandFilename = ['Rand','_','Label','_',num2str(S),'.csv'];   
     %   RandDataFile = fullfile(RandLabelFolder,RandFilename);
     %   RandomLabels = readtable(RandDataFile,"VariableNamingRule","preserve");
     %   randlabels = RandomLabels(:,1:12);
     %   [binarylabels,numtox,numnontox] = BinaryLabels(randlabels);

     % Uncomment the above 5 lines when using random labels


        toxmols  = toxmols + numtox; 
        nontoxmols = nontoxmols + numnontox;
        % Just to make sure, replace potential NaN's with 0s
        Adjmat(isnan(Adjmat)) = 0;
        % Nodemat(isnan(Nodemat)) = 0;
        % Concatenate
        Adjacency = cat(3,Adjacency,Adjmat);


         Features = cat(3,Features,Nodemat);   % Considers 7 features


% Didn't work: One feature only is below -------------

  %      NJ = size(Nodemat,3);
  %      for i=1:250
  %          for j=1:NJ
  %                NodeMatNew(i,j) = Nodemat(i,1,j);
  %          end
  %      end
       
  %      if S == 7
  %      NJ = size(Nodemat,3)
  %      NodeMatNew;
  %      size(NodeMatNew)
  %      end

  %        Features = cat(2,Features,NodeMatNew);  % One feature only

% Didn't work: One feature only is above -------------


        Labels = cat(2,Labels,binarylabels);   


end
      
        Labels = convertCharsToStrings(Labels);


% Double check the sizes and make sure they are correct:
        fprintf('size(Adjacency) is [%s]\n', int2str(size(Adjacency)))
        fprintf('size(Features) is [%s]\n', int2str(size(Features)))
        fprintf('size(Labels) is [%s]\n', int2str(size(Labels)))
        fprintf('Total number of positive molecules is [%s]\n', int2str(toxmols))
        fprintf('Total number of negative molecules is [%s]\n', int2str(nontoxmols))

end