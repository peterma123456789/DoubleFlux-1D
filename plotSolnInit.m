function [ ] = plotSolnInit( W,V,x,t,conservatives0,primitives0 )
% plotSolnInit Plot solutions along with initial conditions.

fprintf('plotting solution at time t = %f ...\n',t);

% get initial conditions
rho0 = primitives0(1,:);
u0 = primitives0(2,:);
p0 = primitives0(3,:);
E0 = conservatives0(3,:);
e0 = (E0 - 0.5*rho0.*u0.^2)./rho0;
T0 = getTfromPandRho(p0,rho0);

% get solutions
rho = V(1,:);
u = V(2,:);
p = V(3,:);
E = W(3,:);
e = (E - 0.5*rho.*u.^2)./rho;
T = getTfromPandRho(p,rho);

% plot
lw = 1;

figure,
set(gcf, 'Position', [560   528   800   1000]);

subplot(3,2,1),plot(x,u,'o-',x,u0,'k','LineWidth',lw);
ylabel('u [m/s]','FontSize',15);
xlabel('x [m]','FontSize',15);
h_legend = legend('Solution','Initial Condition','Location','Best');
set(h_legend,'FontSize',12,'Location','NorthWest');

subplot(3,2,2),plot(x,p/1e6,'o-',x,p0/1e6,'k','LineWidth',lw);
ylabel('p [MPa]','FontSize',15);
xlabel('x [m]','FontSize',15);

subplot(3,2,3),plot(x,rho,'o-',x,rho0,'k','LineWidth',lw);
ylabel('\rho [kg/m^3]','FontSize',15);
xlabel('x [m]','FontSize',15);

subplot(3,2,4),plot(x,T,'o-',x,T0,'k','LineWidth',lw);
ylabel('T [K]','FontSize',15);
xlabel('x [m]','FontSize',15);

subplot(3,2,5),plot(x,E,'o-',x,E0,'k','LineWidth',lw);
ylabel('E [J/m^3]','FontSize',15);
xlabel('x [m]','FontSize',15);

subplot(3,2,6),plot(x,e,'o-',x,e0,'k','LineWidth',lw);
ylabel('e [J/kg]','FontSize',15);
xlabel('x [m]','FontSize',15);

end

