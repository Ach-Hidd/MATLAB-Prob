function sum= increment2()
    persistent persistentCounter; 
    if isempty(persistentCounter)
        persistentCounter = 0;
    else
        persistentCounter = persistentCounter + 1;
    end
    
    sum=persistentCounter+1;
end