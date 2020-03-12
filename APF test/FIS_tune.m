clc;
%% Data Loading
% X is input data, Y is output data
% Traning Data
trnX = data(1:5001,1);
trnY = data(1:5001,3);
% Validation Data
vldX = test_data(:,1);
vldY = test_data(:,3);
dataRange = [min(data)' max(data)'];
%% FIS Creation
fisin = mamfis;     % Mamdani FIS

% Adding Inputs
fisin = addInput(fisin,dataRange(1,:),'Name','d','NumMFs',10);
%fisin = addInput(fisin,dataRange(2,:),'Name','dd','NumMFs',5);
% Adding Output
fisin = addOutput(fisin,dataRange(3,:),'Name','a','NumMFs',10);

%View Structure
figure
plotfis(fisin)

%% Tuning FIS
options = tunefisOptions('Method','patternsearch',...
    'OptimizationType','learning', ...
    'NumMaxRules',10);
options.MethodOptions.MaxIterations = 20;
rng('default');
%runtunefis = true;


fisout1 = tunefis(fisin,[],trnX,trnY,options); 

[in,out,rule] = getTunableSettings(fisout1);
options.OptimizationType = 'tuning';
options.Method = 'ga';
options.MethodOptions.MaxGenerations = 50;
fisout = tunefis(fisout1,[in;out;rule],trnX,trnY,options);
plotfis(fisout)
plotActualAndExpectedResultsWithRMSE(fisout,vldX,vldY);