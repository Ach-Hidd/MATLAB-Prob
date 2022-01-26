%% Task 1 / Implementation of the Himmelblau Function (1.5 Points)

% See <himmelblau.m>

%% Task 2 / Plots (2 Points)
x1= -5:0.1:5;
x2=-5:0.1:5;
[x,y]=meshgrid(x1,x2);
z=himmelblau(x,y);
% surface plot
figure(1);
s= surf(x,y,z);
title('Figure 1-2: Surface plot of the Himmelblau Function');

% contour plot
figure(2);
c=contour(x,y,z,20);
title('Figure 1-1: Contour plot of the Himmelblau Function ');

%% Task 3 / Unconstrained Optimization (2 Points)
hold on
% REVIEW: No need to reimplement the whole function.
fun=@(x)(x(1)^2+x(2)-11)^2+(x(1)+x(2)^2-7)^2;
%a. 
x1=[-3,-3];
% REVIEW: Check status.
[p1,fval] = fminunc(fun,x1);
plot(p1(1),p1(2),'r.','markersize',30)
%b.
x2=[-2,2];
[p2,fval] = fminunc(fun,x2);

plot(p2(1),p2(2),'r.','markersize',30)
%c.
x3=[3,1];
[p3,fval] = fminunc(fun,x3);

plot(p3(1),p3(2),'r.','markersize',30)
%d.
x4=[3,-2];
[p4,fval] = fminunc(fun,x4);

plot(p4(1),p4(2),'r.','markersize',30)
hold off
%% Task 4 / Gradient (1.5 Points)
% a
% see <himmelblau_gradient.m>

% b
%fun1=@(x) deal(himmelblau(x(1),x(2)), himmelblau_gradient(x(1),x(2)));
%fun1=@(x)[4*(x(1).^2+x(2)-11).*x(1)+2*(x(1)+x(2).^2-7);2*(x(1).^2+x(2)-11)+4*(x(1)+x(2).^2-7).*x(2)];
%options = optimoptions('fminunc','Algorithm','trust-region','SpecifyObjectiveGradient',true);
s1= himmelblau_gradient(p1(1),p1(2));
s2= himmelblau_gradient(p2(1), p2(2));
s3= himmelblau_gradient(p3(1), p3(2));
s4= himmelblau_gradient(p4(1), p4(2));

% The magnitube of each gradient is almost zero
%% Task 5 / Finding the Local Maximum (1 Point)
x0=[-2,2];
% REVIEW: No need to reimplement the whole function.
negFUN = @(x)-((x(1)^2+x(2)-11)^2+(x(1)+x(2)^2-7)^2);
[pMax,fval] = fminunc(negFUN,x0);
hold on
plot(pMax(1),pMax(2),'r.','markersize',30)
hold off