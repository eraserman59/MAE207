function [f] = calcTrueAnomoly(EccenAnomoly, eccen)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
B = eccen/(1 + sqrt( 1-eccen^2));
if ((B * cos(EccenAnomoly)) ~= 1)
    f = EccenAnomoly+2*atan((B*sin(EccenAnomoly)) / (1 - B * cos(EccenAnomoly)));
else
    %pretty sure this is impossible, but div by 0 protection
    f = 0;
end

end