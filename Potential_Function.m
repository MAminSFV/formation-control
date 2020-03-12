function Delta = Potential_Function(z_i,z_j)

[~,~,~,~,~,~,~,a,b,c,~,~]= Sim_Parameters();

z = z_i - z_j;                                                  % Connecting vector
d = norm(z);                                                    % Distance
%Ja = a/2*d;                                                     % Attraction 
%Jr = -(b*c/2)*exp((1/c)*d^2);                                                % Replusion
    if z == 0
        Delta = [0;0];
    else
    %% Calculation of the Gradiant of potential field
    %Delta_Ja = a*[z(1)*(1/d);z(2)*(1/d)];
    %Delta_Jr = b*[z(1)*(1/d)*exp((-1/c)*d^2);z(2)*(1/d)*exp((-1/c)*d^2)]; % this is problematic possibly
    %Delta = Delta_Ja - Delta_Jr;
    Deltax = (a*z(1))/(d)- b*z(1)*exp(-d^2/c);
    Deltay = (a*z(2))/(d)- b*z(2)*exp(-d^2/c);
    Delta = [Deltax;Deltay];
   
    end
end