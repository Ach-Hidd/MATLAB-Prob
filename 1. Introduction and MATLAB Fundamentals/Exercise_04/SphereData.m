function [volume, surface, circumference] = SphereData( radius )
%SPHEREDATA Summary of this function goes here
%   Detailed explanation goes here

    % nested function to calculate volume
    function vol = calcVol
        vol = 4/3*pi*radius.^3;
    end

    % nested function to calculate surface
    function sur = calcSur
        sur = 4 * pi * radius.^2;
    end

    % nested function to calculate circumference
    function cf = calcCf
        cf = 2 * pi * radius;
    end

% call nested functions
volume = calcVol;
surface = calcSur;
circumference = calcCf;

end