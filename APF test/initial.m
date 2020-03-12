clear ; clc ;
%% %% Data Generation from Reference Model
%% Settings & Specs
tf = 5;
ts = 0.001;
k_d = 8;
k_p = 25;
%% Single run for test
x0 = [-0.1 0.1];
sim test
test_data = [d(:,2) dd(:,2) a(:,2)];
%% Data Generation
% Initial conditions of each simulation
% x0_t = [1 -1;
%         1  0;
%         1  1;
%         0 -1;
%         0  0;
%         0  1;
%        -1 -1;
%        -1  0;
%        -1 -1];
%    
% k = size(x0_t,1);      % Number of simulations
% p = tf/ts;          % Number of samples per simulation
% n = k*p;               % Total size of database
% 
% d_data = zeros(n,1);
% dd_data = zeros(n,1);
% a_data = zeros(n,1);
% 
% for i=1:1:k
% x0 = x0_t(i,:);
% sim test
% d_data((i-1)*p+i:i+i*p)= d(:,2);
% dd_data((i-1)*p+i:i+i*p)=dd(:,2);
% a_data((i-1)*p+i:i+i*p)=a(:,2);
% end
