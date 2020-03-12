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
 s = 6;
%  axis([-s/2 2*s-5 -s/2+2  s/2-2 ])
 axis([-s/2 s/2 -s/2  s/2])

    

% desired S in image plane
%  plot(z_t(2),z_t(3),'k-o') 
%  plot(z_t(4),z_t(5),'k-o')
%  plot(z_t(6),z_t(7),'k-o')

 
%%  Robots Visuallization as blue Circules
    for k=1:1:n
        plot(z_tt(k,1,i),z_tt(k,2,i),'bo','MarkerSize',10,'LineWidth',2)
    end
%% Leader Visuals
    plot(z_l(i,1),z_l(i,2),'go','MarkerSize',10,'LineWidth',2)
%% Robots orientaion Visuallization
 a=0.25; 
     for k=1:1:n
        plot([z_tt(k,1,i) z_tt(k,1,i)+a*[cos(z_tt(k,3,i))]]',[z_tt(k,2,i) z_tt(k,2,i)+a*[sin(z_tt(k,3,i))]]','b','LineWidth',2)
     end

 
 time=t(i) ;
 time=num2str(time);
 %text(0.25,0,'time=     ');
 %text(0.3,0,time);
 
j=j+1  ;
ff(j)=getframe;
F(j) = getframe(gcf);
% pause(.1)
if i==1 pause;end
end


 hold on
 B = zeros(n,2,length(t));
 B1=nan(length(t),2);
 B2=nan(length(t),2);
 B3=nan(length(t),2);
 B4=nan(length(t),2);
 B5=nan(length(t),2); %leader
 
 j=1;
  
%% Animating the trace
% we have some indexing issues here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
z = Position.signals.values;
z1 = z(1,:,:);
z2 = z(2,:,:);
z3 = z(3,:,:);
z4 = z(4,:,:);

 for i=1:animate_step:length(t)
%  
%     for k=1:1:n
%         B(k,:,j) = [z_ttt(k,1,i),z_ttt(k,2,i)];
%     end

    B1(j,:) = [z1(:,1,i),z1(:,2,i)];
    B2(j,:) = [z2(:,1,i),z2(:,2,i)];
    B3(j,:) = [z3(:,1,i),z3(:,2,i)];
    B4(j,:) = [z4(:,1,i),z4(:,2,i)];
    B5(j,:) = [z_l(i,1),z_l(i,2)]; 

j=j+1;
end
% 

        plot(B1(:,1),B1(:,2),'m--','LineWidth',2);
        plot(B2(:,1),B2(:,2),'m--','LineWidth',2);
        plot(B3(:,1),B3(:,2),'b--','LineWidth',2);
        plot(B4(:,1),B4(:,2),'r--','LineWidth',2);
        plot(B5(:,1),B5(:,2),'g--','LineWidth',2);

% video = VideoWriter('formation5.avi','Uncompressed AVI');
% open(video)
% writeVideo(video,ff);
% close(video)
        
