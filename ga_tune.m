function x = ga_tune(da,dr)
[~,~,~,~,~,~,~,~,~,c,~,~]= Sim_Parameters();
%numberOfVariables = 2; 
lb = [0.005,0.15];
ub = [0.5,0.5];
x = ga(@fun,2,[],[],[],[],lb,ub);
%% Defining Cost Function
    function y = fun(x)
        y = (x(1)/2)*da^2 + (x(2)*c/2)*exp(-dr^2/c) ; 
    end

end