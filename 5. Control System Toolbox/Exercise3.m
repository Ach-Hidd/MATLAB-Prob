%% 1
w = realp('w',3); z = realp('z',0.9);

%% 2
Q = ss([-2*w*z,-w^2;1,0],[w^2;0],[0 1],0)
Qg = genss(Q) % generalized state-space model
%% 3
Qsample = replaceBlock(Qg,'z',[0.1,0.7,1])

%% 4
figure(1)
bode(Qsample)

%% 5
pole(Qsample(:,:,1,3))
%% 6
[omega, zeta] =damp(Qsample(:,:,1,2))
%Frquency = 3, 3
%Damping= 0.7, 0.7

%% 7
g_peak = 20 * log10(getPeakGain(Qsample(:,:,1,1)))

%% 8
t = linspace(0,40,4000); 
input = sin((t/10).*t) ;

%% 9
lsim(Qsample(:,:,1,1),input,t)