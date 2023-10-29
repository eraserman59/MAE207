function [cartesian] = cartesianCalc(mu, orbitalElements, time)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
a = orbitalElements(1);
e = orbitalElements(2);
%covert to radians
orbitalElements(3:6) = deg2rad(orbitalElements(3:6));
Minitial = orbitalElements(6);
Mdelta = sqrt (mu/(a^3)) * time;
Mfinal = Minitial + Mdelta;
EccenAnom = CalcEAnomoly(Mfinal,e);
TrueAnom = calcTrueAnomoly(EccenAnom, e);
R = CalcTransformMatrix(orbitalElements);

p = a * (1-e^2);
radius = p / (1+ e* cos(TrueAnom));

perifocalPos=[0;0;0];
perifocalPos(1) = radius* cos(TrueAnom);
perifocalPos(2) = radius * sin(TrueAnom);

perifocalVel = [0;0;0];
temp1 = sqrt(mu/p);
perifocalVel(1) = temp1 * -sin(TrueAnom);
perifocalVel(2) = temp1 * (e + cos(TrueAnom));

cartesianPos = R * perifocalPos;
cartesianVel = R * perifocalVel;

cartesian(1:3) = cartesianPos.';
cartesian(4:6) = cartesianVel.';

end