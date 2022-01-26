function sum= increment3()
    global globalCounter; 
    if isempty(globalCounter)
        globalCounter = 0;
    else
        globalCounter = globalCounter + 1;
    end
    globalCounter = globalCounter + 1;
end