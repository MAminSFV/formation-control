function FitFun = path_planner(k)
%clc;path
%% Global Path Planning
ka = k(1); kb = k(2);
t = 5000;           % Time Step
x = zeros(t,2);       % Initial Coord
g = [10 0];      % Setting Goal
d_g_0 = norm(g-x(1,:));
d_ob_t = 0;
x = zeros(t,2);       % Initial Coord
% Obstacle Coords the third col is th radius of the obstacle
ob = [5   0  0.25;
      5  -1  0.25;
      3   1  0.25;
      3  -1  0.25];
n_ob = size(ob,1);
att = zeros(t,1);
rep_t = zeros(t,1);
rep = zeros(n_ob,1);
delta = zeros(t,2);
delta_angle = zeros(t,1);
% ka =0.2 ;
% kb =0.001;
L = zeros(t,1); 
d_g = zeros(t,1);
reached = 0;
%% Time Loop %%
for i=2:1:t
    %% Atrraction Function
    g_vec = g - x(i,:);
    d_g(i) = norm(g_vec);
    att(i) = 1/2*ka*d_g(i)^2;                  % attraction energy of this time step
    %% Reach Citeria
    if d_g(i) < 0.1 
        delta_att = [0 0];
        reached = 1;
    else
    delta_att_x = ka*g_vec(1)/(d_g(i));
    delta_att_y = ka*g_vec(2)/(d_g(i));
    delta_att = [delta_att_x delta_att_y]; % grad of att
    end
    
    
    %% Repulsion Function
    delta_rep =zeros(n_ob,2);
    % a for loop to go through all the obstacles
    for j=1:1:n_ob
        ob_vec = ob(j,1:2)- x(i,:);
        r = ob(j,3);
        d_ob = norm(ob_vec);
        rep(j) = (kb/2)*(1/(d_ob-r))^2;
        delta_rep_x = -(kb*ob_vec(1))/(d_ob*(r-d_ob)^3);
        delta_rep_y = -(kb*ob_vec(2))/(d_ob*(r-d_ob)^3);
        delta_rep(j,:) = [delta_rep_x  delta_rep_y];        % grad of rep for each obstacle
        
        d_ob_t = d_ob_t + d_ob;                       % for use of safe zone citeria, sum of all the distances through time
    end
    rep_t(i) = sum(rep);                                    % Sum of repulsion energy of this time step
    delta_rep_t = sum(delta_rep);
    delta(i,:) = delta_att - delta_rep_t;                   % Superposition of Grads
    
    x(i+1,:) = x(i,:) + delta(i,:);                        % moving the leader in the field
    L(i)= norm(delta(i,:));
    delta_angle(i)= abs(atan2(x(i,2),x(i,1))-atan2(x(i-1,2),x(i-1,1)));
    
end

%% Path Evaluation
% Shortest Path Length Citeria
%path_length1 = norm(sum(abs(delta)));
path_length2 = sum(L);
shortest_dis = d_g_0/path_length2;
% Smoothness Citeria
angle = sum(delta_angle);
smoothness = 1/angle;
% Safe Zone Citeria
safe = 1000*d_g_0/d_ob_t;
%% Fitness Function
k1 = 0.001;     % Shortest Path Weight
k2 = 0.001;     % Smoothness Weight
k3 = 0.01;     % Safety weight
k4 = 100;   % Poitns to reach
FitFun = 1/((k1*shortest_dis)+ (k2*smoothness) + (k3*safe) +(k4*reached))
%% Visualization
% figure
% hold on;
% plot(g(1),g(2),'r-o')               % Goal
% plot(x(:,1),x(:,2),'bo')            % Leader Trajectory 
% for k=1:1:n_ob
%     viscircles(ob(k,1:2),ob(k,3));  % Obstacles
%  end
end

    
    
    
   
   
   
