function fib= fibonacci_recursive(n)
    if(n>=0)
        if(n==1)
            fib=1;
        elseif(n==0)
            fib=0;
        else
            fib= fibonacci_recursive(n-1)+fibonacci_recursive(n-2);
        end
    else
        fib=0;
    end  
end

%recursive takes longer time. 