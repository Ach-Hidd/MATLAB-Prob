%% 1
syms p q r
K(p,q,r)= log(p^q);
K(p,0,r)
%0
%% 2
L(p,q,r)= sin(r)^2+cos(p+q)^2; 
L(r-q,q,r)
%cos(r)^2 + sin(r)^2
%% 3
simplify(L(r-q,q,r))
%1