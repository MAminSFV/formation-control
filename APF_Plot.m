a = 0.05; %0.00551819
b = 0.15; %0.15
c = 0.1;
xx = [-3:0.1:3];
yy = [-3:0.1:3];
[x,y] = meshgrid(xx,yy);
z =(a/2).*((x+1).^2+(y+1).^2)+ b.*exp(-(1/c).*(x.^2+y.^2)); % -100*exp(-0.1.*((x-5).^2+(y-5).^2));
surf(x,y,z)
