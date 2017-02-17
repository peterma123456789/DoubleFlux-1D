function [ RHS ] = getRHS_DF( W,V,gammaS,e0S )
% getRHS_DF Compute RHS vector using the double-flux model. First-order
% reconstruction and HLLC Riemann solver are used.

global Nx dx

% First-order reconstruction
fa_L = [V(:,Nx),V(:,1:Nx)];
fa_R = [V(:,1:Nx),V(:,1)];

% HLLC flux
flux_L = HLLC_DF(fa_L(:,1:Nx),fa_R(:,1:Nx),gammaS,e0S);
flux_R = HLLC_DF(fa_L(:,2:Nx+1),fa_R(:,2:Nx+1),gammaS,e0S);

% Calculate RHS
RHS = -(flux_R-flux_L)/dx;

end

