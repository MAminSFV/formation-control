function Delta = Potential_Function2(z_i,z_j,z_rf,L,a1)
[~,~,~,~,~,~,~,a,b,c,~,~]= Sim_Parameters();
%a = 0;
%z_d = z_j - z_rf;
z = z_i - z_j;                                                  % Connecting vector
zz = z - z_rf;
d = norm(z);                                                    % Distance
dd = norm(zz);
%Ja = a/2*d;                                                    % Attraction 
%Jr = -(b*c/2)*exp((1/c)*d^2);                                  % Replusion
    if dd == 0
        Delta = [0;0];
    else
    %% Calculation of the Gradiant of potential field
    % First term is the attraction with an offset, the second term is
    % repulsion.(same old one)
    
    % Attraction for formation
    Da_x = L*((a+a1)*(zz(1))/dd);
    Da_y = L*((a+a1)*(zz(2))/dd);
    Da = [Da_x;Da_y];
    % Repulsion for collision avoidance
    Dr_x = -(b*z(1)*exp(-d^2/c));
    Dr_y = -(b*z(2)*exp(-d^2/c));
    Dr = [Dr_x;Dr_y];
    Delta = Da + Dr;
   
    end
end