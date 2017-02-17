function [ gammaS,e0S ] = getGammaSandE0S( V )
% getGammaSandE0S Compute effective specific heat ratio and effective
% reference energy for the double-flux model.

rho = V(1,:);
p = V(3,:);
T = getTfromPandRho(p,rho);
e = getEnergyfromTandRho(T,rho);

sos = getSos(V);

gammaS = sos.^2.*rho./p; % Eq. (12)
e0S = e - p./rho./(gammaS-1); % Eq. (16)

end

