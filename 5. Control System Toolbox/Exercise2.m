%% 1
H = filt([5/15,4/15,3/15,2/15,1/15],[1],1/50)

%% 2
H_us= upsample(H, 2)

%% 3
H_rs = d2d(H,1/100,'tustin')

%% 4
figure(1)
step(H);
figure(2)
step(H_us)
figure(3)
step(H_rs)
% H and H_us

%% 5
Y = zpk([],[-10,-3,-1,-1],1)

%% 6
[Yb, g] = balreal(Y)

%% 7
Yr = modred(Yb, [3,4],'del')
K = modred(Yb,3:4)

%% 8
figure(1)
step(Y)
hold on
step(Yr)
hold off
legend('Y','Yr')

%% 9
[Ys,Yf] = freqsep(Y,2)

%% 10
figure(1)
step(Ys)
hold on
step(Yf)
step(Ys+Yf)
hold off
legend('Ys','Yf','Y')
