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