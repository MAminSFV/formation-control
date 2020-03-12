function [zd,qd] = Agent_Kinematics(q,u)
L = 0.21;   % handling point length
% Should we generalize here?
g = [cos(q) -L*sin(q);
     sin(q)  L*cos(q)];
  
qd = u(2);
zd = g*u.';
end