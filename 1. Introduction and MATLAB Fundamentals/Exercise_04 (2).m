%  add 'Exercise_04' to Matlab search path
addpath('Exercise_04')

%% ========================================================================
%  Task 1
%  ------------------------------------------------------------------------
%  set n
n = 250;

%  start counter
tic;

%  run fibonacci script
fibonacci_script;

%  display calculation time
toc

% print results
fprintf('The %ith element of the fibonacci series is %i.\n',n,a_n);

%% ========================================================================
%  Task 2
%  ------------------------------------------------------------------------
%  clear workspace 
clearvars -except 'n';
%  start counter
tic;

%  run fibonacci function
a_n = fibonacci(n);

%  display calcultion time
toc

%  print result
fprintf('The %ith element of the fibonacci series is %i.\n',n,a_n);

%% ========================================================================
%  Task 3
%  ------------------------------------------------------------------------
%  start counter
tic;

%  run recursive fibonacci function
a_n = fibonacci_recursive(n);

%  display calculation time
toc

%  print result
fprintf('The %ith element of the fibonacci series is %i.\n',n,a_n);

%% ========================================================================
%  Task 4
%  ------------------------------------------------------------------------
%  call sphere data function and assign output to variables
[volume, surface, circumference] = SphereData(1);

%  print result
fprintf('Sphere data:\n Volume:\t\t%0.3f\n Surface:\t\t%0.3f\n Circumference:\t%0.3f\n', volume, surface, circumference);

%% ========================================================================
%  Task 5
%  ------------------------------------------------------------------------
%  call sphere data function and assign output to variables
[volume, surface, circumference] = SphereData_local(1);

%  print result
fprintf('Sphere data:\n Volume:\t\t%0.3f\n Surface:\t\t%0.3f\n Circumference:\t%0.3f\n', volume, surface, circumference);