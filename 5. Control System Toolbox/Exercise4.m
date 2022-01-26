%% 1
G= tf(1,[0.25,1,1])

%% 2
[controller,info] = pidtune(G, 'p',2.5)
% 77.3196

%% 3
pidTuner(G, 'pid')
% Kp = 38.5912  Ki= 76.6341 Kd= 4.8548

%% 4
controlSystemDesigner(G)

%% 7
% C = 3.28*(1+s)/(1+0.17s)

%% 9
% amplitute : 0.991  time: 0.36