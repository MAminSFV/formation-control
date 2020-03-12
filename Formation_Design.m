function [z_0_t,z_0_l,L,z_rf]= Formation_Design()
%% Initial Configuration
% Agents Initial Configuration
z_0_t = [-2    2    0;
         -2    -2   0;
         -3    -2   0;
         -3    2   0];
% Leader Initial Configuration
z_0_l = [1 0];        
%% %% Formation Graph
%% 2 Followers case
% Laplacian
% L = [0 1 1;
%      1 0 1;
%      0 0 0];
%% 4 Followers Case
% a square following the leader
L = [0 1 1 0 1;
     1 0 0 1 1;
     1 0 0 1 0;
     0 1 1 0 0;
     0 0 0 0 0];
 %% Relative Formation Cell
 % The ralative spacing among agents
 n = size(L,1);
 z_rf = cell(n);
  %% 2 Followers Case
%   % Agent 1
%   z_rf{1,1} = [0 0];
%   z_rf{1,2} = [0 2];
%   z_rf{1,3} = [-1 1];
%   % Agent 2
%   z_rf{2,1} = [0 -2];
%   z_rf{2,2} = [0 0];
%   z_rf{2,3} = [-1 -1];
  %% 4 Followers Case
 % Agent 1
 z_rf{1,1} = [0 0];
 z_rf{1,2} = [0 2];
 z_rf{1,3} = [1 0];
 z_rf{1,4} = [0 0];     % not connected 
 z_rf{1,5} = [-1 1];
 % Agent 2
 z_rf{2,1} = [0 -2];
 z_rf{2,2} = [0 0];
 z_rf{2,3} = [0 0];     % not connected
 z_rf{2,4} = [1 0];
 z_rf{2,5} = [-1 -1];
 % Agent 3
 z_rf{3,1} = [-1 0];
 z_rf{3,2} = [0 0];     % not connected
 z_rf{3,3} = [0 0];
 z_rf{3,4} = [0 2];
 z_rf{3,5} = [0 0];     % not connected
 % Agent 4 
 z_rf{4,1} = [0 0];     % not connected
 z_rf{4,2} = [-1 0];
 z_rf{4,3} = [0 -2];
 z_rf{4,4} = [0 0];
 z_rf{4,5} = [0 0];     % not connected