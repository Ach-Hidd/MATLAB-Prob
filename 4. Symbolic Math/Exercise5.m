clear all
%% 1
syms phi(t) g l m d
dphi_dt= diff(phi,t); 
%assume(phi(0)==1); 
%assumeAlso(dphi_dt(0)==0);
phi(t)= dsolve(diff(phi,t,2)==-g/l*phi(t)-d/(m*l^2)*dphi_dt,phi(0)==1,dphi_dt(0)==0)
%Warning: Ignored assumptions on constants. 
%Warning: Ignored assumptions on constants. 
% C1*exp(-(t*(d + (d^2 - 4*g*l^3*m^2)^(1/2)))/(2*l^2*m)) + C2*exp(-(t*(d - (d^2 - 4*g*l^3*m^2)^(1/2)))/(2*l^2*m))
%Correct answer: 
%(exp(-(t*(d - (d^2 - 4*g*l^3*m^2)^(1/2)))/(2*l^2*m))*(d + (d^2 - 4*g*l^3*m^2)^(1/2)))/(2*(d^2 - 4*g*l^3*m^2)^(1/2)) - (exp(-(t*(d + (d^2 - 4*g*l^3*m^2)^(1/2)))/(2*l^2*m))*(d - (d^2 - 4*g*l^3*m^2)^(1/2)))/(2*(d^2 - 4*g*l^3*m^2)^(1/2))

%% 2
phi_sub=subs(phi,{g,l,m,d},{9.81,10,5,50})
%- (978500^(1/2)*exp((t*(- 50 + 978500^(1/2)*1i))/1000)*(50 + 978500^(1/2)*1i)*1i)/1957000 - (978500^(1/2)*exp(-(t*(50 + 978500^(1/2)*1i))/1000)*(- 50 + 978500^(1/2)*1i)*1i)/1957000

%% 3
vpa(subs(phi_sub,5),40)
%0.141...261
%% 4 and 5
xt= subs(l.*sin(phi_sub),{l},{10}); 
zt= subs(-l.*cos(phi_sub),{l},{10}); 
fplot3(xt,t,zt,[0 40])
xlabel('l*sin(phi)');zlabel('-l*cos(phi)');ylabel('t');