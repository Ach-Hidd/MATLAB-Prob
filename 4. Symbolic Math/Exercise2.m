%% 1
digits_old= digits

%% 2
digits(20)

%% 3
e_exact= exp(sym('1'))

%% 4
e_approx=vpa(e_exact)

%% 5
double(e_approx-e_exact)

%% 6
digits(digits_old)