function [volume, surface, circumference] = SphereData_local( radius )
%SPHEREDATA Summary of this function goes here
%   Detailed explanation goes here

% call local functions
volume = calcVol(radius);
surface = calcSur(radius);
circumference = calcCf(radius);

end

% local function to calculate volume
function vol = calcVol(radius)
vol = 4/3*pi*radius.^3;
end

% local function to calculate surface
function sur = calcSur(radius)
sur = 4 * pi * radius.^2;
end

% local function to calculate circumference
function cf = calcCf(radius)
cf = 2 * pi * radius;
end