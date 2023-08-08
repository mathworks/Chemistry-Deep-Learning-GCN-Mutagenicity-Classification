
function [binarylabels,numtox,numnontox] = BinaryLabels(labels)

t = 0;
n = 0;
   labelsmat = table2array(labels);
 for i = 1:size(labelsmat,1) 

%% Replace NaN with 0s (always necessary)
labelsmat(isnan(labelsmat)) = 0;

  sumlabels = sum (labelsmat,2);   %Uncomment if not using random labels
 % sumlabels = labelsmat(:,1);  % Use this for Random Labels


       if sumlabels(i) == 0
          binarylabels{i} = 'Negative';
          n = n + 1;
       else
          binarylabels{i} = 'Positive';
          t = t + 1;
       end
    %  binarylabels(i) = string(binarylabels(i));
 end
       numtox = t;
       numnontox = n;
end