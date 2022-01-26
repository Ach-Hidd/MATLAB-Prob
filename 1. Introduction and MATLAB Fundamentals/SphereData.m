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