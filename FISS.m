function FIS=FIS()
%% %% Fuzzy Controller
r = 1;
%% Creation & Settings
% this function can't be used in SIMULINK. The mamfis command does't
% support Code generation
a1 = mamfis;

%% Inputs

% Input1
a1 = addInput(a1,[-1,1],"Name","input");
a1 = addMF(a1,"input","trimf",[-2,-1 ,0],'Name',"N");
a1 = addMF(a1,"input","trimf",[-1, 0 ,1],'Name',"Z");
a1 = addMF(a1,"input","trimf",[0 , 1 ,2],'Name',"P");


%% Outputs
% Output1
a1=addOutput(a1,[-1,1],'Name',"u_fis");
a1=addMF(a1,"u_fis",'trimf',[-1,-r,0],'Name',"NE");
a1=addMF(a1,"u_fis",'trimf',[-1,0,1],'Name',"ZE");
a1=addMF(a1,"u_fis",'trimf',[0,r,1],'Name',"PE");


rulelist=[1 1 1 1;
          2 2 1 1;
          3 3 1 1];
          
a1=addRule(a1,rulelist);
%a1=setfis(a1,'defuzzmethod','lom');
FIS = getFISCodeGenerationData(a1);


% [output,~,~,~,ruleFiring] = evalfis(a1,s);
% u = output;
% w1 = ruleFiring(3);
% w3 = ruleFiring(1);
