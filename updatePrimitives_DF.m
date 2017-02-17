function [ V ] = updatePrimitives_DF( W,gammaS,e0S )
% updatePrimitives_DF Update primitive variables given conservative
% variables using the double-flux model.

rho = W(1,:);
u = W(2,:)./W(1,:);
E = W(3,:);
p = (gammaS-1).*(E - rho.*e0S - 0.5*rho.*(u).^2); % Eq. (22)

V = zeros(size(W));
V(1,:) = rho;
V(2,:) = u;
V(3,:) = p;

end

