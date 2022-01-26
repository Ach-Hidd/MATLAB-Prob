%% 2.1
function sum= increment1(n)
    sum=n+1;
end

function sum= increment2()
    persistent persistentCounter; 
    if isempty(persistentCounter)
        persistentCounter = 0;
    else
        persistentCounter = persistentCounter + 1;
    end
    
    sum=persistentCounter+1;
end

function sum= increment3()
    global globalCounter; 
    if isempty(globalCounter)
        globalCounter = 0;
    else
        globalCounter = globalCounter + 1;
    end
    globalCounter = globalCounter + 1;
end

%% 2.2
arr1=zeros(1000); 
tic
for i=1:1000
    arr1(i)=i*i; 
end
toc

arr2=0;
tic
for i=1:1000
    arr2=[arr2 i*i]; 
end
toc

%% 2.3
A= magic(20000); 
B= A; 
B(1)=0; 