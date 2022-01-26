%% 1
prompt='which calculation mode is satisfied?';
mode=input(prompt,'s');
if(strcmp(mode,'sum'))
    disp('Calculate the sum of all integers from 1 to n ');
elseif (strcmp(mode,'factorial'))
    disp(' Calculate the factorial of n ');
else
    disp('Calculate the nth element of the fibonacci series');
end

%% 2
prompt='which calculation mode is satisfied?';
mode=input(prompt,'s');
switch mode
    case 'sum'
        disp('Calculate the sum of all integers from 1 to n ');
    case 'factorial'
        disp(' Calculate the factorial of n ');
    case 'fibonacci'
        disp('Calculate the nth element of the fibonacci series');
end
%% 3
sum=0;n=100;
for i=1:n
    sum=sum+i;
end
%% 4
fac=1; n=100;
if(n==0)
    fac=1;
end
while(n>0)
    fac=fac*n;
    n=n-1;
end
%% 5
arr=int16.empty(n+1,0);
index=3; 
arr(1)=0;arr(2)=1;
while(index<=n+1)
    arr(index)=arr(index-1)+arr(index-2);
    index=index+1;
end
%% 6
tic
n=10000000; %max value
arr=int16.empty(n+1,0);
index=3;
arr(1)=0;arr(2)=1;
while(index<=n+1)
    arr(index)=arr(index-1)+arr(index-2);
    index=index+1;
end
toc

