clear; close all; clc;
%% ========================================================================
%  Task 1
%  ------------------------------------------------------------------------
%  find out about the magic function

doc magic


%% ========================================================================
%  Task 2
%  ------------------------------------------------------------------------
%  create magic matrix A

A = magic(3);

%% ========================================================================
%  Task 3
%  ------------------------------------------------------------------------
%  create b vector

b = (10:10:30)';

%% ========================================================================
%  Task 4
%  ------------------------------------------------------------------------
%  solve linear equation
% (a)
inv_time    = tic;
x_inv       = inv(A)*b; %#ok<MINV> <- suppresses warning for inefficient inv
toc(inv_time)

% (b)
backslash_time  = tic;
x_backslash     = A \ b;
toc(backslash_time)

%% ========================================================================
%  Task 5
%  ------------------------------------------------------------------------
%  - perform elemntwise multiplication to get square numbers
%  - reshape to column vector
%  - sort square numbers

A = sort(reshape(A.*A,[],1));

%% ========================================================================
%  Task 6
%  ------------------------------------------------------------------------
%  - create 3x3 zeros matrix
%  - create row vector containing even numbers from 2 to 18
%  - write vector elements to matrix by accessing all linear indices (using
%  the colon operator :)

B = zeros(3);
B(:) = 2:2:2*numel(B);

%% ========================================================================
%  Task 7
%  ------------------------------------------------------------------------
%  copy B three times
B_subs = B; B_lin = B; B_log = B;

%  divide elements by accessing them individually using subscript indexing
B_subs(2,1) = B_subs(2,1)/4;
B_subs([1 3],2) = B_subs([1 3],2)/4;
B_subs(2,3) = B_subs(2,3)/4;

%  divide elements by accessing every other element using linear indexing
B_lin(2:2:end) = B_lin(2:2:end)/4;

%  divide elements with no remainder using logical indexing
B_log(mod(B_log,4)==0) = B_log(mod(B_log,4)==0) / 4;
