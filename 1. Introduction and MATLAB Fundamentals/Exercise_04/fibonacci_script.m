%% script
a_1 = 1;
a_2 = 0;

a_n = 1;
for iter = 3:n
    a_2 = a_1;
    a_1 = a_n;
    a_n = a_1 + a_2;
end

