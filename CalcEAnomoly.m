function [EccenAnom] = CalcEAnomoly(M, e)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

error = 1;
Ecurr = M;

while (error > 0.0015)
    % ~ .085 degree error
    Enext = interation(Ecurr, M, e);
    error = Ecurr - Enext;
    Ecurr = Enext;
end

EccenAnom = Ecurr;

end

function [Enext] = interation(Ecurr,M, e)

temp1 =Ecurr -  e * sin(Ecurr) - M;
temp2 = 1 - e * cos(Ecurr);

if (temp2 ~= 0)
  Enext = Ecurr - (temp1/temp2);
else 
  Enext = Ecurr; 
end
end