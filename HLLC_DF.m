function [ f_HLLC ] = HLLC_DF( V_L,V_R,gammaS,e0S )
% HLLC_DF Compute HLLC flux with double-flux model.

sign = @(s) (s>=0) - (s<=0);
      
u_L = V_L(2,:);
u_R = V_R(2,:);

rho_L = V_L(1,:);
rho_R = V_R(1,:);

p_L = V_L(3,:);
p_R = V_R(3,:);

a_L = sqrt(gammaS.*p_L./rho_L);
a_R = sqrt(gammaS.*p_R./rho_R);

E_L = p_L./(gammaS-1) + rho_L.*e0S + 0.5*rho_L.*u_L.^2; % Eq. (21)
E_R = p_R./(gammaS-1) + rho_R.*e0S + 0.5*rho_R.*u_R.^2; % Eq. (21)

f_L = [rho_L.*u_L; rho_L.*(u_L).^2+p_L; u_L.*(E_L+p_L)];
f_R = [rho_R.*u_R; rho_R.*(u_R).^2+p_R; u_R.*(E_R+p_R)];

W_L = [rho_L; rho_L.*u_L; E_L];
W_R = [rho_R; rho_R.*u_R; E_R];

s_L = u_L - a_L;
s_R = u_R + a_R;

sM = (p_L - p_R - rho_L.*u_L.*(s_L-u_L) + rho_R.*u_R.*(s_R-u_R))./(rho_R.*(s_R-u_R)-rho_L.*(s_L-u_L));
pM = rho_R.*(u_R-s_R).*(u_R-sM) + p_R;

WML = [(s_L-u_L)./(s_L-sM).*rho_L;
       ((s_L-u_L).*rho_L.*u_L + (pM-p_L))./(s_L-sM);
       ((s_L-u_L).*E_L - p_L.*u_L + pM.*sM)./(s_L-sM)];

WMR = [(s_R-u_R)./(s_R-sM).*rho_R;
       ((s_R-u_R).*rho_R.*u_R + (pM-p_R))./(s_R-sM);
       ((s_R-u_R).*E_R - p_R.*u_R + pM.*sM)./(s_R-sM)];

s_minus = min(0,s_L);
s_plus = max(0,s_R);

f_HLLC = bsxfun(@times,(1+sign(sM))/2,(f_L + bsxfun(@times,s_minus,(WML - W_L)))) +...
    bsxfun(@times,(1-sign(sM))/2,(f_R + bsxfun(@times,s_plus,(WMR - W_R))));

end

