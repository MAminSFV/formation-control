close all
%% I
% data handling
z_tt = z_t.signals.values;
n = size(z_tt,1);
t = tout;
j=0;
hold on
for i=1:animate_step:size(t)
    clf 
    grid on
    hold on; 

 axis equal
 axis([-5 5 -5  5 ])

    

% desired S in image plane
%  plot(z_t(2),z_t(3),'k-o') 
%  plot(z_t(4),z_t(5),'k-o')
%  plot(z_t(6),z_t(7),'k-o')

 
%%  Robots Visuallization as blue Circules
    for k=1:1:n
        plot(z_tt(k,1,i),z_tt(k,2,i),'b-o')
    end
 
%% Robots orientaion Visuallization
 a=0.25; 
     for k=1:1:n
        plot([z_tt(k,1,i) z_tt(k,1,i)+a*[cos(z_tt(k,3,i))]]',[z_tt(k,2,i) z_tt(k,2,i)+a*[sin(z_tt(k,3,i))]]','b')
     end

 
 time=t(i) ;
 time=num2str(time);
 %text(0.25,0,'time=     ');
 %text(0.3,0,time);
 
j=j+1  ;
ff(j)=getframe;

% pause(.1)
if i==1 pause;end
end
 hold on
 B = zeros(n,2,length(t));
 B1=nan(length(t),2);
 B2=nan(length(t),2);
 B3=nan(length(t),2);
 B4=nan(length(t),2);
 
 j=1;
  
%% Animating the trace
% we have some indexing issues here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
z_ttt = z_tt(:,1:2); 
for i=1:animate_step:length(t)
 
    for k=1:1:n
        B(k,:,j) = [z_ttt(k,1,i),z_ttt(k,2,i)];
    end
%B2(j,:) = [z_tt(i,4,i),z_tt(i,5,i)];
%B3(j,:) = [z_tt(i,6,i),z_tt(i,7,i)];
%B4(j,:) = [z_t(i,8),z_t(i,9)];
 
j=j+1;
end

    for k=1:1:n
       plot(B(k,1,:),B1(k,2,:),'r--'); 
    end
        plot(B1(:,1),B1(:,2),'r--');
        plot(B2(:,1),B2(:,2),'r--');
        plot(B3(:,1),B3(:,2),'r--');
        %plot(B4(:,1),B4(:,2),'r--');
