function FIS = FIS_Generator(r)

%% Importing Adaptive Parameters
 
%% Fuzzy Settings
% General Settings
myFIS.name = 'V1';
myFIS.type = 'mamdani';
myFIS.andMethod = 'min';
myFIS.orMethod = 'max';
myFIS.defuzzMethod = 'centroid';
myFIS.impMethod = 'min';
myFIS.aggMethod = 'max';
% Input settings
myFIS.input(1).name = 'S';
myFIS.input(1).range = [-1 1];
myFIS.input(1).mf(1).name = 'N';
myFIS.input(1).mf(1).type = 'trimf';
myFIS.input(1).mf(1).params = [-1 -0.98 0];
myFIS.input(1).mf(2).name = 'Z';
myFIS.input(1).mf(2).type = 'trimf';
myFIS.input(1).mf(2).params = [-1 0 1];
myFIS.input(1).mf(3).name = 'P';
myFIS.input(1).mf(3).type = 'trimf';
myFIS.input(1).mf(3).params = [0 0.98 1];
% Outputs
myFIS.output(1).name = 'u_fis';
myFIS.output(1).range = [-1 1];
myFIS.output(1).mf(1).name = 'N';
myFIS.output(1).mf(1).type = 'trimf';
myFIS.output(1).mf(1).params = [-1 -r 0];
myFIS.output(1).mf(2).name = 'Z';
myFIS.output(1).mf(2).type = 'trimf';
myFIS.output(1).mf(2).params = [-1 0 1];
myFIS.output(1).mf(3).name = 'P';
myFIS.output(1).mf(3).type = 'trimf';
myFIS.output(1).mf(3).params = [0  r  1];
% Rule Settings
myFIS.rule(1).antecedent = 1;
myFIS.rule(1).consequent = 1;
myFIS.rule(1).weight = 1;
myFIS.rule(1).connection = 1;
myFIS.rule(2).antecedent = 2;
myFIS.rule(2).consequent = 2;
myFIS.rule(2).weight = 1;
myFIS.rule(2).connection = 1;
myFIS.rule(3).antecedent = 3;
myFIS.rule(3).consequent = 3;
myFIS.rule(3).weight = 1;
myFIS.rule(3).connection = 1;



end