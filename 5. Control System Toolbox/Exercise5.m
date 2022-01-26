Kt = 3.45;
T = 0.001;
i_1 = 1/6.5;
i_2 = 1/5.6;
d = 0.038;
%% 1
sys_1= tf(1/T,[1,0]);
closed_loop = feedback(sys_1,-1);
G_wheel = Kt*closed_loop*i_1*i_2*d/2

%% 2
pidTuner(closed_loop, 'pi')
% Kp= 0.9999  Ki= 0.1575
