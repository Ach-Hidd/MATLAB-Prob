%% 1
syms t omega_r_wheel(t) omega_l_wheel(t) d v_l v_r l_wheels v omega
v_r= omega_r_wheel(t)*d/2;
v_l= omega_l_wheel(t)*d/2;
v= 1/2*(v_l+v_r);
omega=1/l_wheels*(v_r-v_l);

%% 2
v_star= simplify(subs(v,{omega_l_wheel(t),omega_r_wheel(t)},{8*sin(t)^2,8*cos(t)^2}))
%2*d
omega_star=simplify(subs(omega,{omega_l_wheel(t),omega_r_wheel(t)},{8*sin(t)^2,8*cos(t)^2}))
%(4*d*cos(2*t))/l_wheels

%% 3
assume(t>0)
new_omega= subs(omega_star,{d,l_wheels},{0.03,0.1})
fplot(new_omega)
digits(3)
s= vpasolve(new_omega==0,2.5)
%2.36

%% 4
x_dot= subs(v*cos(omega),{omega_l_wheel(t),omega_r_wheel(t),d,l_wheels},{8*sin(t)^2,8*cos(t)^2,0.03,0.1});
y_dot=subs(v*sin(omega),{omega_l_wheel(t),omega_r_wheel(t),d,l_wheels},{8*sin(t)^2,8*cos(t)^2,0.03,0.1});
x= vpa(subs(int(x_dot,t,0,50),{d,l_wheels,omega_l_wheel(t),omega_r_wheel(t)},{0.03,0.1,8*sin(t)^2,8*cos(t)^2}))
y= vpa(subs(int(y_dot,t,0,50),{d,l_wheels,omega_l_wheel(t),omega_r_wheel(t)},{0.03,0.1,8*sin(t)^2,8*cos(t)^2}))