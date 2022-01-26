%% 1
F = zpk([18],[-3+2i,-3-2i],4/2225)

%% 2
G = tf([-4/2225,23*47/2225],[1,1,4.25],'InputDelay',0.05)

%% 3
G_zpk = zpk(G)
% -0.0017978 (s-270.3)

%% 4
E = parallel(F,G)

%% 5
Kp= 3.16; Ki = 15.9;Kd = 0.156; 
C = pid(Kp, Ki, Kd, 1)

%% 6
open_loop = series(C,E); 
closed_loop= feedback(open_loop,-1)

%% 7
order(closed_loop)
% 6

%% 8
isproper(closed_loop) 
% true
