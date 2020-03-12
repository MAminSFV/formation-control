function [n,Sa,Sb,alpha,beta,delta,gamma,a,b,c,lambda1,lambda2]= Sim_Parameters()
n =4;
Sa = 1;
Sb = -1;
alpha = 10;
beta = 3;
lambda1 = 0.1*eye(2);
lambda2 = 0.1*eye(2);
delta = 1000;
gamma = 50000;
a = 0.00; %0.00551819
b = 5; %0.15
c = 0.15;
end