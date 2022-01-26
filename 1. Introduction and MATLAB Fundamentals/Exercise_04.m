%% 1
n=10; %max value
arr=int16.empty(n+1,0);
index=3;
arr(1)=0;arr(2)=1;
while(index<=n+1)
    arr(index)=arr(index-1)+arr(index-2);
    index=index+1;
end 

%% 2
clear; 
function fib=getfibo(n)
    arr=int16.empty(n+1,0);
    index=3;
    arr(1)=0;arr(2)=1;
    while(index<=n+1)
        arr(index)=arr(index-1)+arr(index-2);
        index=index+1;
    end
    fib=arr(n);
end

%% 3
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

%% 4
function[volume, surface, circumference]=SphereData(r)

    volume=4/3*pi*tripleMe;
    
    function m=tripleMe
        m=r^3;
    end

    surface=4*pi*squareMe;
    
    function n=squareMe
       n=r^2; 
    end

    circumference = 2*pi*r;
end
%% 5
function[volume, surface, circumference]=SphereData2(r)

volume=tripleMe(r)*4/3*pi;

surface=4*pi*squareMe(r);

circumference = 2*pi*r;

end

function m=tripleMe(x)
m=x^3;
end

function n=squareMe(y)
n=y^2;
end
