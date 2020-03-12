function z = CostFunction(x,da,dr)
[~,~,~,~,~,~,~,~,~,c,~,~]= Sim_Parameters();
%% Defining Cost Function
z = a*(1/da)- b*exp(-dr^2/c);