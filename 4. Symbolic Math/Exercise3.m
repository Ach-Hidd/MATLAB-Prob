%% 1
syms x 
f(x)= 27*x*log(x+3)+cos(2^x); 
int(f,-1,1)
%(cosint(2) - cosint(1/2))/log(2) - 27*log(16) + 81
%% 2
syms y z
g= z/y*tan(y*z)+1/y^2*log(cos(y*z));
dg_dz=diff(g,z);
simplify(dg_dz)
%-z/(sin(y*z)^2 - 1)
%% 3
syms alpha
p= [alpha*z/x,z/y,log(x*y)]'; 
curl(p)
%[0;conj(alpha)/conj(x) - 1/conj(x);0]

%% 4
syms s a
q= 1/sqrt(s+a); 
ilaplace(q,s)
%exp(-a*s)/(s^(1/2)*pi^(1/2))
%% 5
h= exp(x);
taylortool(h)
% exp(1)+exp(1)*(x-1)+(exp(1)*(x-1)^2)/2