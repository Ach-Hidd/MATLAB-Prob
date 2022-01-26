%% 1
syms x
eqn= abs(exp(x))==1; 
sol_x_all= solve(eqn,x,'ReturnConditions', true)

%y*i,in(y, 'real')

%% 2
assume(x,'real');
sol_x_real= solve(eqn,x)
%0

%% 3
syms a b c
sol_k = solve(a^2*b^2==0,a-b/2==c,[a,b])
% a= c or 1
% b= o or -2*c

%% 4
assume(c>1);
assume(b>=0);
sol_k_condi = solve(a^2*b^2==0,a-b/2==c,[a,b])
% a=c, b=0
