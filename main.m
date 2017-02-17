%% Init

clear all, close all, clc;

global Nx dx x dt

% CFL number
CFL = 1;

% Grids (periodic)
a = 0;
b = 1;
Nx = 512;
dx = (b-a)/Nx;
x = a+dx/2:dx:b-dx/2; % cell center location

% Initial conditions (sharp bump)
eta = 1e-10;
T_L = 300;
T_R = 100;
T0 = T_L+(T_R-T_L)/2.0*(tanh((x-0.25)/eta)+tanh(-(x-0.75)/eta));
u0 = 100*ones(1,Nx);
p0 = 50e5*ones(1,Nx);
rho0 = getRhofromTandP(T0,p0);

primitives0 = [rho0;u0;p0]; % [rho, u, p]
conservatives0 = primitivesToConservatives(primitives0); % [rho, rho*u, E]
W = conservatives0;
V = primitives0;
printInfo(W,V,0,0,0); % print information
% plotSolnInit(W,V,x,0,conservatives0,primitives0); % plot solution

% Simulation time
t_final = b/u0(1); % simulation end time = one period
t_sim = 0; % simulation time
step = 0; % time step
CHECK = 100; % check interval

%% Solve

while (t_sim < t_final)

    %%%%%%%%%%%%%%%%
    % Calculate dt %
    %%%%%%%%%%%%%%%%

    sos = getSos(V); % speed of sound
    u = V(2,:);
    dt = CFL*dx/max(max(max(u,u+sos),u-sos));
    if (t_sim + dt > t_final) dt = t_final - t_sim; end % last time step dt
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Time Advancement (Algorithm 1) %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Store gammaS and e0S
    [gammaS,e0S] = getGammaSandE0S(V);

    % Time marching with double-flux model (RK3)
    k1 = W + dt*getRHS_DF(W,V,gammaS,e0S);
    Vk1 = updatePrimitives_DF(k1,gammaS,e0S);
    
    k2 = 3/4*W + 1/4*k1 + 1/4*dt*getRHS_DF(k1,Vk1,gammaS,e0S);
    Vk2 = updatePrimitives_DF(k2,gammaS,e0S);
    
    W = 1/3*W + 2/3*k2 + 2/3*dt*getRHS_DF(k2,Vk2,gammaS,e0S);
    V = updatePrimitives_DF(W,gammaS,e0S);
    
    % Update conservatives
    W = primitivesToConservatives(V);

    %%%%%%%%%%%%%%%%%%
    % Check Solution %
    %%%%%%%%%%%%%%%%%%
    
    % Update simulation time and step
    t_sim = t_sim + dt;
    step = step + 1;

    % Print information
    if (mod(step,CHECK) == 0 || t_sim >= t_final)
        printInfo(W,V,step,t_sim,dt);
    end
                
end

%% Plot

plotSolnInit(W,V,x,t_final,conservatives0,primitives0);




