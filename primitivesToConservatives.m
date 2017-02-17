function [ conservatives ] = primitivesToConservatives( primitives )
% primitivesToConservatives Convert primitive variables to conservative variables.
%   Primitive variables are assumed to have rho, u, p.
%   Convervative variables are assumed to have rho, rhou, E.

rho = primitives(1,:);
u = primitives(2,:);
p = primitives(3,:);

T = getTfromPandRho(p,rho);

conservatives(1,:) = rho;
conservatives(2,:) = rho.*u;
conservatives(3,:) = rho.*getEnergyfromTandRho(T,rho) + 0.5*rho.*u.^2;

end

