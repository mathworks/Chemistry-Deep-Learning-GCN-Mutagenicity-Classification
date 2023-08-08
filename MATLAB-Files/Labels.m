function [symbs] = Labels(nodesym,NumAtm)
%Convert atomic numbers to symbols

symbs = cell(NumAtm,1);
 for i = 1:numel(symbs)
     if nodesym(i) == 1
         symbs{i} = 'H';
     elseif nodesym(i) == 2
         symbs{i} = 'He';
     elseif nodesym(i) == 3
         symbs{i} = 'Li';       
     elseif nodesym(i) == 4
         symbs{i} = 'Be';
     elseif nodesym(i) == 5
         symbs{i} = 'B';
     elseif nodesym(i) == 6
         symbs{i} = 'C';
     elseif nodesym(i) == 7
         symbs{i} = 'N';
     elseif nodesym(i) == 8
         symbs{i} = 'O';
     elseif nodesym(i) == 9 
         symbs{i} = 'F';
     elseif nodesym(i) == 10
         symbs{i} = 'Ne';
     elseif nodesym(i) == 11
         symbs{i} = 'Na';     
     elseif nodesym(i) == 12
         symbs{i} = 'Mg';
     elseif nodesym(i) == 13
         symbs{i} = 'Al';
     elseif nodesym(i) == 14
         symbs{i} = 'Si';
     elseif nodesym(i) == 15
         symbs{i} = 'P';
     elseif nodesym(i) == 16 
         symbs{i} = 'S';
     elseif nodesym(i) == 17 
         symbs{i} = 'Cl';
     elseif nodesym(i) == 18
         symbs{i} = 'Ar';
     elseif nodesym(i) == 19
         symbs{i} = 'K';
     elseif nodesym(i) == 20
         symbs{i} = 'Ca';   
     elseif nodesym(i) == 21
         symbs{i} = 'Sc';
     elseif nodesym(i) == 22
         symbs{i} = 'Ti'; 
     elseif nodesym(i) == 23
         symbs{i} = 'V';
     elseif nodesym(i) == 24
         symbs{i} = 'Cr';       
     elseif nodesym(i) == 25
         symbs{i} = 'Mn';
     elseif nodesym(i) == 26
         symbs{i} = 'Fe';
     elseif nodesym(i) == 27
         symbs{i} = 'Co';
     elseif nodesym(i) == 28
         symbs{i} = 'Ni';
     elseif nodesym(i) == 29
         symbs{i} = 'Cu';
     elseif nodesym(i) == 30
         symbs{i} = 'Zn';         
     elseif nodesym(i) == 31
         symbs{i} = 'Ga';   
     elseif nodesym(i) == 32
         symbs{i} = 'Ge'; 
     elseif nodesym(i) == 33
         symbs{i} = 'As';
     elseif nodesym(i) == 34
         symbs{i} = 'Se';       
     elseif nodesym(i) == 35
         symbs{i} = 'Br';
     elseif nodesym(i) == 36
         symbs{i} = 'Kr';
     elseif nodesym(i) == 37
         symbs{i} = 'Rb';
     elseif nodesym(i) == 38
         symbs{i} = 'Sr';
     elseif nodesym(i) == 39
         symbs{i} = 'Y';
     elseif nodesym(i) == 40
         symbs{i} = 'Zr';         
     elseif nodesym(i) == 41
         symbs{i} = 'Nb';   
     elseif nodesym(i) == 42
         symbs{i} = 'Mo'; 
     elseif nodesym(i) == 43
         symbs{i} = 'Tc';
     elseif nodesym(i) == 44
         symbs{i} = 'Ru';       
     elseif nodesym(i) == 45
         symbs{i} = 'Rh';
     elseif nodesym(i) == 46
         symbs{i} = 'Pd';
     elseif nodesym(i) == 47
         symbs{i} = 'Ag';
     elseif nodesym(i) == 48
         symbs{i} = 'Cd';
     elseif nodesym(i) == 49
         symbs{i} = 'In';
     elseif nodesym(i) == 50
         symbs{i} = 'Sn';         
     elseif nodesym(i) == 51
         symbs{i} = 'Sb';   
     elseif nodesym(i) == 52
         symbs{i} = 'Te'; 
     elseif nodesym(i) == 53
         symbs{i} = 'I';
     elseif nodesym(i) == 54
         symbs{i} = 'Xe';       
     elseif nodesym(i) == 55
         symbs{i} = 'Cs';
     elseif nodesym(i) == 56
         symbs{i} = 'Ba';
     elseif nodesym(i) == 57
         symbs{i} = 'La';
     elseif nodesym(i) == 58
         symbs{i} = 'Ce';
     elseif nodesym(i) == 59
         symbs{i} = 'Pr';
     elseif nodesym(i) == 60
         symbs{i} = 'Nd';         
     elseif nodesym(i) == 61
         symbs{i} = 'Pm';   
     elseif nodesym(i) == 62
         symbs{i} = 'Sm'; 
     elseif nodesym(i) == 63
         symbs{i} = 'Eu';
     elseif nodesym(i) == 64
         symbs{i} = 'Gd';       
     elseif nodesym(i) == 65
         symbs{i} = 'Tb';
     elseif nodesym(i) == 66
         symbs{i} = 'Dy';
     elseif nodesym(i) == 67
         symbs{i} = 'Ho';
     elseif nodesym(i) == 68
         symbs{i} = 'Er';
     elseif nodesym(i) == 69
         symbs{i} = 'Tm';
     elseif nodesym(i) == 70
         symbs{i} = 'Yb';         
     elseif nodesym(i) == 71
         symbs{i} = 'Lu';   
     elseif nodesym(i) == 72
         symbs{i} = 'Hf'; 
     elseif nodesym(i) == 73
         symbs{i} = 'Ta';
     elseif nodesym(i) == 74
         symbs{i} = 'W';       
     elseif nodesym(i) == 75
         symbs{i} = 'Re';
     elseif nodesym(i) == 76
         symbs{i} = 'Os';
     elseif nodesym(i) == 77
         symbs{i} = 'Ir';
     elseif nodesym(i) == 78
         symbs{i} = 'Pt';
     elseif nodesym(i) == 79
         symbs{i} = 'Au';
     elseif nodesym(i) == 80
         symbs{i} = 'Hg';         
     elseif nodesym(i) == 81
         symbs{i} = 'Tl';   
     elseif nodesym(i) == 82
         symbs{i} = 'Pb'; 
     elseif nodesym(i) == 83
         symbs{i} = 'Bi';
     elseif nodesym(i) == 84
         symbs{i} = 'Po';       
     elseif nodesym(i) == 85
         symbs{i} = 'At';
     elseif nodesym(i) == 86
         symbs{i} = 'Rn';
     elseif nodesym(i) == 87
         symbs{i} = 'Fr';
     elseif nodesym(i) == 88
         symbs{i} = 'Ra';
     elseif nodesym(i) == 89
         symbs{i} = 'Ac';
     elseif nodesym(i) == 90
         symbs{i} = 'Th';         
     elseif nodesym(i) == 91
         symbs{i} = 'Pa';   
     elseif nodesym(i) == 92
         symbs{i} = 'U'; 
     elseif nodesym(i) == 93
         symbs{i} = 'Np';
     elseif nodesym(i) == 94
         symbs{i} = 'Pu';       
     elseif nodesym(i) == 95
         symbs{i} = 'Am';
     elseif nodesym(i) == 96
         symbs{i} = 'Cm';
     elseif nodesym(i) == 97
         symbs{i} = 'Bk';
     elseif nodesym(i) == 98
         symbs{i} = 'Cf';
     elseif nodesym(i) == 99
         symbs{i} = 'Es';
     elseif nodesym(i) == 100
         symbs{i} = 'Fm';         
     elseif nodesym(i) == 101
         symbs{i} = 'Md';   
     elseif nodesym(i) == 102
         symbs{i} = 'No'; 
     elseif nodesym(i) == 103
         symbs{i} = 'Lr';
     elseif nodesym(i) == 104
         symbs{i} = 'Rf';       
     elseif nodesym(i) == 105
         symbs{i} = 'Db';
     elseif nodesym(i) == 106
         symbs{i} = 'Sg';
     elseif nodesym(i) == 107
         symbs{i} = 'Bh';
     elseif nodesym(i) == 108
         symbs{i} = 'Hs';
     elseif nodesym(i) == 109
         symbs{i} = 'Mt';
     elseif nodesym(i) == 110
         symbs{i} = 'Ds';         
     elseif nodesym(i) == 111
         symbs{i} = 'Rg';  
     elseif nodesym(i) == 112
         symbs{i} = 'Cn'; 
     elseif nodesym(i) == 113
         symbs{i} = 'Nh';
     elseif nodesym(i) == 114
         symbs{i} = 'Fl';       
     elseif nodesym(i) == 115
         symbs{i} = 'Mc';
     elseif nodesym(i) == 116
         symbs{i} = 'Lv';
     elseif nodesym(i) == 117
         symbs{i} = 'Ts';
     elseif nodesym(i) == 118
         symbs{i} = 'Og';
     end
 end
%disp(symbols)