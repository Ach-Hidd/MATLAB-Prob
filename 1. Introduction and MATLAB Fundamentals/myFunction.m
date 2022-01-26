% myFunction.m
function b = myFunction(a)

b = squareMe(a) + doubleMe;

    function y = doubleMe
        y = 2*a;
    end
end

function c = squareMe(x)
    c = x.^2;
end