clc;
%% Initial Conditions   
[n,~]= Sim_Parameters();                        % Number of Followers                   
[z_0_t,z_0_l,L,z_rf]= Formation_Design();
                 
%% Initial Field Imposed Velocity
% Delta_l = zeros(n,2);
% Delta_i = zeros(n,2);
% %Inter-agent field interactions 
%     for i=1:1:n
%         for j=1:1:n
%             Delta_i(i,:) = Potential_Function2(z_0_t(i,1:2),z_0_t(j,1:2),z_rf{i,j},L(i,j));
%         end
%     end
% 
%     %Leader - agent interaction
%     for i=1:1:n
%         Delta_l(i,:) = Potential_Function2(z_0_t(i,1:2),z_0_l.',z_rf{i,n+1},L(i,n+1));
%     end
%     
%     Delta_0 = Delta_l + Delta_i;

%% Simulation Settings
Ts = 0.001;      % Sampling time
tf = 120;        % time duration
sim Formation

%% Animation
animate_step = 1000;
anim

%% Output plots
% Error Plots

% S-Sd Plots

% control commands




