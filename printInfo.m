function [ ] = printInfo( W,V,step,t_sim,dt )
% printInfo Print out information at specified time step and time.

rho = W(1,:);
rhou = W(2,:);
E = W(3,:);
u = V(2,:);
p = V(3,:);

fprintf('------------------------------------------------\n');
fprintf('time step: %d time: %f dt: %g\n',step,t_sim,dt);
fprintf('------------------------------------------------\n');
fprintf('rho, %0.3g:%0.3g\n',min(rho),max(rho));
fprintf('rhou, %0.3g:%0.3g\n',min(rhou),max(rhou));
fprintf('E, %0.3g:%0.3g\n',min(E),max(E));
fprintf('u, %0.3g:%0.3g\n',min(u),max(u));
fprintf('p, %0.3g:%0.3g\n',min(p),max(p));
fprintf('\n');

end

