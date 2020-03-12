function [zd,qd] = Agent_Kinematics(q,u)
L = 0.21;   % handling point length

d = 0;      % The lumped uncertainity (?)

g = [ cos(q) -L*sin(q);
      sin(q)  L*cos(q)];
  
qd = u(2) ;
zd = g*u.'+d;
end