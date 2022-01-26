function a_n = fibonacci_recursive( n )
%FIBONACCI_RECURSIVE Calculate nth fibonacci number recursively
%   Recursive function to calculate the nth fibonacci number

%  check if n is greater than 2
if n>2
    % call recursive fibonacci function for 2 precessors of n and sum
    % results
    a_n = fibonacci_recursive(n - 1) + fibonacci(n - 2);
else
    % return 1
    a_n = 1;
end

end

