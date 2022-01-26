function returnValue = incPersistent
% declare persistent
persistent persistentCounter

% check if persistent variable is initialized
if isempty(persistentCounter)
    persistentCounter = 0;
end

% increment persistent variable
persistentCounter = persistentCounter + 1;

% return counter value
returnValue = persistentCounter;
end