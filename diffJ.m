syms Ja Jr a b c d xi xj yi yj xd yd r
Ja = a/2*(sqrt((xi-xj-xd)^2+(yi-yj-yd)^2));                           %Attraction 
Jr = -(b*c/2)*exp((-1/c)*((xi-xj)^2+(yi-yj)^2)); 
Jrr = d/2*(1/(sqrt((xi-xj)^2+(yi-yj)^2)-r))^2;
J = Jr;
a=[diff(Jrr,xi);
  diff(Jrr,yi)];
simplify(a)

(d*(2*xi - 2*xj))/(2*(r - ((xi - xj)^2 + (yi - yj)^2)^(1/2))^3*((xi - xj)^2 + (yi - yj)^2)^(1/2))
 