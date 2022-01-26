clear; close all; clc;
%% ========================================================================
%  Task 1
%  ------------------------------------------------------------------------
%  compare global, persistent and local variables

% add path of Exercise 2
addpath Exercise_02

% declare and initialize global counter
global globalCounter;
globalCounter = 0;
localCounter = 0;

% clear persistent variable
clear incPersistent;

% loop each increment function 10 times
for iter = 1:10
    incGlobal;

    persistentCounter = incPersistent;
    localCounter = incLocal(localCounter);
end

% display results
fprintf('Global Counter:\t\t%i\nPersistent Counter:\t%i\nLocal Counter:\t\t%i\n',...
    globalCounter, persistentCounter, localCounter);

% remove path
rmpath Exercise_02
%% ========================================================================
%  Task 2
%  ------------------------------------------------------------------------
%  memory allocation

tic;
for iter = 1:1000
    a(iter) = iter^2; %#ok<SAGROW>
end
toc

tic;
b = zeros(1,1000);
for iter = 1:1000
    b(iter) = iter^2;
end
toc


%% ========================================================================
%  Task 3
%  ------------------------------------------------------------------------
%  lazy copy

% read memory used in Matlab
[usr, ~] = memory;
fprintf('Memory used:\t%f\n',usr.MemUsedMATLAB);
% Memory used:	2397605888.000000

A = magic(2000);

[usr, ~] = memory;
fprintf('Memory used:\t%f\n',usr.MemUsedMATLAB);
% Memory used:	2429607936.000000

B = A;

[usr, ~] = memory;
fprintf('Memory used:\t%f\n',usr.MemUsedMATLAB);
% Memory used:	2429607936.000000

B(1) = 0;

[usr, ~] = memory;
fprintf('Memory used:\t%f\n',usr.MemUsedMATLAB);
% Memory used:	2461609984.000000