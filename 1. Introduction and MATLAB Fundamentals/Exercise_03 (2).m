%% ========================================================================
%  Task 1
%  ------------------------------------------------------------------------
%  request user input for function
calcMode = input('Select calculation mode: ','s');

%  if statement to check input and return description
if strcmpi(calcMode, 'sum')
    disp('Calculate sum');
elseif strcmpi(calcMode, 'factorial')
    disp('Calculate factorial');
elseif strcmpi(calcMode, 'fibonacci')
    disp('Calculate fibonacci');
else
    disp('Unknown calculation mode');
end
%% ========================================================================
%  Task 2
%  ------------------------------------------------------------------------
%  request user input for function
calcMode = input('Select calculation mode: ','s');

%  switch case statement to check input and return description
switch calcMode
    case 'sum'
        disp('Calculate sum');
    case 'factorial'
        disp('Calculate factorial');
    case 'fibonacci'
        disp('Calculate fibonacci');
    otherwise
        disp('Unknown calculation mode');
end

%% ========================================================================
%  Task 3
%  ------------------------------------------------------------------------
%  set n as 100
n = 100;

%  initialze mySum
mySum = 0;

%  loop all integers from 1 to n
for k = 1:n
    % add each integer to mySum
    mySum = mySum + k;
end

%  print result
fprintf('The sum of all numbers from 1 to %i is %i.\n',n,mySum)

%% ========================================================================
%  Task 4
%  ------------------------------------------------------------------------
%  set n
n = 10;

%  initialize the loop variable
k = 0;

%  initialize myFactorial
myFactorial = 1;

%  loop while loop variable is smaller than n
while k<10
    % increment
    k = k + 1;
    
    % multiply loop variable to myFactorial
    myFactorial = myFactorial * k;
end

%  print result
fprintf('The factorial of %i is %i.\n',n,myFactorial);
    
%% ========================================================================
%  Task 5
%  ------------------------------------------------------------------------
%  initialize a(k) and a(k-1) with values for a(2) and a(1), specifically 1
a_1 = 1;
a_k = 1;

%  set n
n = 7;

%  loop untit loop variable is equal to n
for k = 3:n
    % shift a(k-1) and a(k-2) to next variable
    a_2 = a_1;
    a_1 = a_k;
    
    % calculate new a(k)
    a_k = a_1 + a_2;
end

%  print results
fprintf('The %ith element of the fibonacci series is %i.\n',n,a_k);

%% ========================================================================
%  Task 6
%  ------------------------------------------------------------------------
%  set maximal calculation time
maxtime = 0.06;

%  start clock
tic;

%  initialize a(k) and a(k-1) for a(2) and a(1), specifically 1
a_k = 1;
a_1 = 1;

%  set n
n = 10000;

% loop k until it 
for k = 3:n
    % check if calculation time has exceeded maximal time
    if toc > maxtime
        % display calculation time exceeded message
        disp('Calculation time exceeded!');
        % exit loop execution
        break;
    end
    
    % display current calcuation time
%     toc
    
    % shift a(k-1) and a(k-2) to next variable
    a_2 = a_1;
    a_1 = a_k;
    
    % calculate new a(k)
    a_k = a_1 + a_2;
end

%  print results
fprintf('The %ith element of the fibonacci series is %i.\n',n,a_k);

% display calcuation time
toc