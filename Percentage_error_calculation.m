clc;
clear all;
t = 11;
q = 1;
h = 0;  % range of focal depths, it was changed manually before each iteration in the range of 5 of 65 with setep size of 5
B1 = 3.9;  % P wave velocity in first layer            
B2 = 4.6;  % P wave velocity in second layer
H = 10:10:70;                  % layer thickness
c = [4.1483	3.9846	3.941525	3.92457	3.91622	3.9115	3.908575
4.398	4.148	4.036	3.9845	3.9575	3.9415	3.9314
4.4992	4.297	4.14825	4.06365	4.0147	3.98455	3.964825
4.54125	4.398	4.25245	4.14825	4.0805	4.036	4.0058
4.56185	4.46	4.336	4.228	4.1483	4.0918	4.0517
4.5733	4.5	4.398	4.2971	4.213	4.1487	4.100
4.5803	4.5243	4.4429	4.3534	4.271	4.2025	4.14827
4.5849	4.54125	4.47535	4.39805	4.3211	4.25245	4.195
4.588	4.55315	4.49925	4.433	4.3632	4.297	4.2387
4.5903	4.562	4.517	4.4605	4.39805	4.336	4.27865
4.59195	4.5683	4.53065	4.482	4.42671	4.3695	4.31445
4.59324	4.5733	4.54125	4.4992	4.4503	4.3981	4.34611
4.59425	4.577	4.549625	4.513	4.46967	4.4223	4.373865
4.59503	4.5803	4.5563	4.5245	4.48575	4.443	4.39806
4.595668	4.58275	4.56185	4.53355	4.4992	4.4604	4.419
4.5962	4.5849	4.5664	4.5413	4.5105	4.4754	4.43735];    %Velocity vector
X = linspace(0,1000,1001);    % Epicentral distances from 200 to 1000 with steps of 5 Km 
for k=1:16   
  for i=1:7
    for l=1:1001 
          Xcr(i) = (H(i)-h)*(B1)/((B2)^2-(B1)^2)^(0.5);    % calculation of Xcritical
          Tcr(i) = ((H(i)-h)*(B2))/((B1)*(((B2)^2-(B1)^2)^(0.5))); % calculation of T critical
          T(k,i,l) = Tcr(i)+(X(l)-Xcr(i))/c(k,i);  % calculation of Travel time
          cpr(k,i,l) = X(l)/T(k,i,l); % predicted surface wave velocity
          E(k,i,l) = (c(k,i)-cpr(k,i,l))*100/c(k,i);  % percentage error 
    end
  end
end


%figure(1)
%plot(H,E(8,:,1),'-o','Color','b','MarkerFaceColor','b','MarkerEdgeColor','b','LineWidth',2,'MarkerSize',5)
%text(35,19,'T=40s, X=200Km','FontSize',16)
%hold on 
%plot(H-10,E(8,:,2),'-o')
%plot(H-15,E(8,:,2),'-o')
%grid on
%xlim([10,70])
%ylim([0,20])
%xlabel('H','FontSize',16)
%ylabel('E','FontSize',16)
%a=["200Km","300Km","400Km","500Km","600Km","700Km","800Km","900Km","1000Km"];
%hold on
%T=linspace(5,80,16);
%figure(3)
%for i=1:9
 %  surf(H-h,T,E(:,:,i))
 %  colormap hsv;
 %  colorbar 
 %  hold on 
 %  text(65,80,E(16,7,i),a(i))
%end
%surf(H,T,5*ones(16,7))

%zlabel('Percentage Eror')
%ylabel('Time Period')
%xlabel('H-h')
%grid 
%legend('200Km','300Km','400Km','500Km','600Km','700Km','800Km','900Km','1000Km','FontSize',13)
%color=[[0 0.32 0.89],[0.89 0 0.32],[0 0 0],[0 1 1],[0 0 1],[0 1 0],[1 0 0],[0 0 0.5],[1 0 1],[0.1 0.7 0],[0 0.4470 0.7410],[0.8500 0.3250 0.0980],[0.9290 0.6940 0.1250],[0.4940 0.1840 0.5560],[0.4660 0.6740 0.1880],[0.3010 0.7450 0.9330],[0.6350 0.0780 0.1840]];
%plot(H,E(:,:,1),'-o','Color','r','MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',2,'MarkerSize',5)
%plot(H(2:13),E(8,1:12,1),'-o','Color','g','MarkerFaceColor','g','MarkerEdgeColor','g','LineWidth',2,'MarkerSize',5)
%plot(H(3:13),E(8,1:11,1),'-o','Color','b','MarkerFaceColor','b','MarkerEdgeColor','b','LineWidth',2,'MarkerSize',5)
%legend('h=5Km,H=[10:70]Km','h=10Km,H=[15:70]Km','h=15Km,H=[20:70]Km','FontSize',16)
%xlabel('H','FontSize',16)
%ylabel('E','FontSize',16)
%text(35,13.5,'T=40s, X=200Km','FontSize',16)
%figure(1)
%color=[[0 0.32 0.89],[0.89 0 0.32],[0 0 0],[0 1 1],[0 0.55 0],[0 1 0],[1 0 0],[0 0 0.5],[1 0 1],[0.1 0.7 0],[0 0.4470 0.7410],[0.8500 0.3250 0.0980],[0.9290 0.6940 0.1250],[0.4940 0.1840 0.5560],[0.4660 0.6740 0.1880],[0.3010 0.7450 0.9330],[0.6350 0.0780 0.1840]];
%i=1;
%k=1;
%while i<=49 && k<=7
 %  plot(T,E(:,k,3),'-o','Color',[color(i),color(i+1),color(i+2)],'MarkerFaceColor',[color(i),color(i+1),color(i+2)],'MarkerEdgeColor',[color(i),color(i+1),color(i+2)],'LineWidth',2,'MarkerSize',5)
  % hold on
  % ax=gca;
  % ax.FontSize=15;
  % xlim([0,80])
  % ylim([0,20])
  % i=i+3;
  % k=k+1;
 
%end
%legend('5s','10s','15s','20s','25s','30s','35s','40s','45s','50s','55s','60s','65s','70s','75s','80s')
%xlabel('(H-h)')
%ylabel('E')
%text(35,19.5,'X = 1000Km','FontSize',16)
%hold off   %%
%hold on
figure(2)
color=[[0.5 0 0.5],[1 0 1],[0.9 0.9 0],[0, 1, 1],[0.75 0.25 0],[0 0 1],[0 0 0],[0 0.8 0.6],[1 0 0],[0.1 0.7 0],[0.4 0.4470 0.7410],[0.8500 0.750 0.750],[1 1 0.0],[0. 0.525 0.098],[0,0.9,0.5],[0.9 0.30 0.3]];
i = 1;
k= 1;
B=permute(E,[3,2,1]);
while i<=49 && k<=16
    plot(X(50:1001),B(50:1001,q,k),'-o','Color',[color(i),color(i+1),color(i+2)],'MarkerFaceColor',[color(i),color(i+1),color(i+2)],'MarkerEdgeColor',[color(i),color(i+1),color(i+2)],'LineWidth',2,'MarkerSize',0.5)
    hold on
    ax=gca;
    ax.FontSize=15;
    xlim([50,1000])
    %ylim([0,45])
    yticks([0,5,10,15,20,25,30, 35, 40, 45])
    grid on 
    grid minor
    pbaspect([1,1,1])    
    i=i+3;
    k=k+1;
 
end
legend('5s','10s','15s','20s','25s','30s','35s','40s','45s','50s','55s','60s','65s','70s','75s','80s')
xlabel('X')
ylabel('E')
text(400,t,append('H=',num2str(H(q)),'Km,h=',num2str(h),'Km'),'FontSize',16)
%plot(X,5*ones(1,length(X)))
%hold off   %


%for k=1:length(c)   
 % for i=1:length(H)
  %  for l=1:length(X)
   %     p=polyfit(H-h,E(k,:,l),1);
    %    m(k,l)=p(1);
     %   c(k,l)=p(2);
    %end
  %end
%end

%T=linspace(5,80,16);
%color=[[0 0.32 0.89],[0.89 0 0.32],[0 0 0],[0 1 1],[0 0 1],[0 1 0],[1 0 0],[0 0 0.5],[1 0 1],[0.1 0.7 0],[0 0.4470 0.7410],[0.8500 0.3250 0.0980],[0.9290 0.6940 0.1250],[0.4940 0.1840 0.5560],[0.4660 0.6740 0.1880],[0.3010 0.7450 0.9330],[0.6350 0.0780 0.1840]];
%i=1;
%k=1;
%while i<=49 && k<=9
   %plot(T,c(:,k),'-o','Color',[color(i),color(i+1),color(i+2)],'MarkerFaceColor',[color(i),color(i+1),color(i+2)],'MarkerEdgeColor',[color(i),color(i+1),color(i+2)],'LineWidth',2,'MarkerSize',5)
   %ax=gca;
   %ax.FontSize=15;
  % i=i+3;
 %  k=k+1;
 
%end
%legend('200Km','300Km','400Km','500Km','600Km','700Km','800Km','900Km','1000Km','FontSize',13)
%xlabel('T')
%ylabel('c')
%hold off   
%m1 = m(:,1);
%c1= c(:,1);
%pp1= -7.6*10^(-5);
%pp2= 0.01255;
%pp3 = 0.08572;
%%plot(T,c1,T,pp1*(T.^(2))+pp2*T+pp3,'-o','b','LineWidth',2)
%subplot(211)
%plot(T,c1,'-o','Color','b','MarkerFaceColor','b','MarkerEdgeColor','b','LineWidth',2,'MarkerSize',5)
%hold on
%plot(T,pp1*(T.^(2))+pp2*T+pp3,'-o','Color','r','MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',1.5,'MarkerSize',5)
%text(30,0.65,'X=200Km','FontSize',16)
%xlabel('T','FontSize',16)
%ylabel('c','FontSize',16)
%legend('c','quadratic fitting','FontSize',16)
%subplot(212)
%plot(T,c1'-(pp1*(T.^(2))+pp2*T+pp3),'-o','Color','k','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth',1.5,'MarkerSize',5)
%xlabel('T','FontSize',16)
%ylabel('residual','FontSize',16)
%legend('residual','FontSize',16)
%for l=1:9
 %   p=polyfit(T',m(:,l),2);
  %  p1(l)=p(1);
   % p2(l)=p(2);
    %p3(l)=p(3);
%end

%pp1 = -3.452*10^(-11);
%pp2 = 6.14*10^(-8);
%pp3 = -3.341*10^(-5);
%subplot(211)
%plot(X,p1,'-o','Color','b','MarkerFaceColor','b','MarkerEdgeColor','b','LineWidth',2,'MarkerSize',5)
%hold on
%plot(X,pp1*(X.^(2))+pp2*X+pp3,'-o','Color','r','MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',1.5,'MarkerSize',5)
%xlabel('X','FontSize',16)
%ylabel('p1','FontSize',16)
%legend('p1','quadratic fitting','FontSize',16)
%subplot(212)
%plot(X,p1-(pp1*(X.^(2))+pp2*X+pp3),'-o','Color','k','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth',1.5,'MarkerSize',5)
%xlabel('X','FontSize',16)
%ylabel('residual','FontSize',16)
%legend('residual','FontSize',16)


%a = 0.2956;
%b = -0.8381;
%subplot(211)
%plot(X,p2,'-o','Color','b','MarkerFaceColor','b','MarkerEdgeColor','b','LineWidth',2,'MarkerSize',5)
%hold on
%plot(X,a*X.^(b),'-o','Color','r','MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',1.5,'MarkerSize',5)
%xlabel('X','FontSize',16)
%ylabel('p2','FontSize',16)
%legend('p2','quadratic fitting','FontSize',16)
%subplot(212)
%plot(X,p2-(a*X.^(b)),'-o','Color','k','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth',1.5,'MarkerSize',5)
%xlabel('X','FontSize',16)
%ylabel('residual','FontSize',16)
%legend('residual','FontSize',16)

%a = 19.11;
%b = -0.9663;
%subplot(211)
%plot(X,p3,'-o','Color','b','MarkerFaceColor','b','MarkerEdgeColor','b','LineWidth',2,'MarkerSize',5)
%hold on
%plot(X,a*X.^(b),'-o','Color','r','MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',1.5,'MarkerSize',5)
%xlabel('X','FontSize',16)
%ylabel('p3','FontSize',16)
%legend('p3','quadratic fitting','FontSize',16)
%subplot(212)
%plot(X,p3-(a*X.^(b)),'-o','Color','k','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth',1.5,'MarkerSize',5)
%xlabel('X','FontSize',16)
%ylabel('residual','FontSize',16)
%legend('residual','FontSize',16)

%for l=1:9
 %   p=polyfit(T',c(:,l),2);
 %   p4(l)=p(1);
 %   p5(l)=p(2);
 %   p6(l)=p(3);
%end

%a = 240.8;
%b = -1.861;
%subplot(211)
%plot(X,p5,'-o','Color','b','MarkerFaceColor','b','MarkerEdgeColor','b','LineWidth',2,'MarkerSize',5)
%hold on
%plot(X,a*X.^(b),'-o','Color','r','MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',1.5,'MarkerSize',5)
%xlabel('X','FontSize',16)
%ylabel('p5','FontSize',16)
%legend('p5','quadratic fitting','FontSize',16)
%subplot(212)
%plot(X,p4-(a*X.^(b)),'-o','Color','k','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth',1.5,'MarkerSize',5)
%xlabel('X','FontSize',16)
%ylabel('residual','FontSize',16)
%legend('residual','FontSize',16)


%a = -0.0001558;
%b = -0.004268;
%subplot(211)
%plot(X,p4,'-o','Color','b','MarkerFaceColor','b','MarkerEdgeColor','b','LineWidth',2,'MarkerSize',5)
%hold on
%plot(X,a*exp(b*X),'-o','Color','r','MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',1.5,'MarkerSize',5)
%xlabel('X','FontSize',16)
%ylabel('p4','FontSize',16)
%legend('p4','quadratic fitting','FontSize',16)
%subplot(212)
%plot(X,p4-(a*exp(b*X)),'-o','Color','k','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth',1.5,'MarkerSize',5)
%xlabel('X','FontSize',16)
%ylabel('residual','FontSize',16)
%legend('residual','FontSize',16)

%a = 3916;
%b = -2.025;
%subplot(211)
%plot(X,p6,'-o','Color','b','MarkerFaceColor','b','MarkerEdgeColor','b','LineWidth',2,'MarkerSize',5)
%hold on
%plot(X,a*X.^(b),'-o','Color','r','MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',1.5,'MarkerSize',5)
%xlabel('X','FontSize',16)
%ylabel('p6','FontSize',16)
%legend('p6','quadratic fitting','FontSize',16)
%subplot(212)
%plot(X,p6-(a*X.^(b)),'-o','Color','k','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth',1.5,'MarkerSize',5)
%xlabel('X','FontSize',16)
%ylabel('residual','FontSize',16)
%legend('residual','FontSize',16)


