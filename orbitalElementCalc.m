function [orbitals] = orbitalElementCalc(cartesian,time,mu)
%calcs the oribital element values from cartesian, mu and time since periapse

H = angularMomentum(cartesian);
Hnorm = norm(H);
Hunit = H/Hnorm;
E = EnergyCalc(cartesian,mu);
EccenVec = EccCalc(cartesian,mu,H);
eccent = sqrt (1 + ((2*E*Hnorm^2)/(mu^2)));

semiAxis = -mu/(2 * E);
Z = [0,0,1];
X = [1,0,0];
Y = [0,1,0];
temp = dot(Hunit, Z);
inclination = acos(temp);
inclination = rad2deg(inclination);
temp = dot(Hunit,X);
temp2 = dot(-Hunit, Y);
if (temp2 ~= 0) 
  LongAscendingNode = atan(temp/temp2);
else 
  LongAscendingNode = 0;
end
LongAscendingNode = rad2deg(LongAscendingNode);
% convert to positive values since matlab range is [-pi/2,pi/2] for atan
if (LongAscendingNode < 0)
    LongAscendingNode = LongAscendingNode + 180;
end
EccenVectNorm = norm(EccenVec);
EccenUnit = EccenVec/EccenVectNorm;

temp1 = dot(EccenUnit, Z);
temp2 = cross(Hunit, EccenUnit);
temp3 = dot(temp2, Z);
if (temp3 ~= 0)
  periasis = atan(temp1 / temp3);
else
  periasis = 0;
end
periasis = rad2deg(periasis);
if (periasis < 0)
    periasis = periasis + 180;
end

pos = cartesian(1:3);
vel = cartesian(4:6);
temp1 = dot(EccenVec, pos);
temp2 = EccenVectNorm * norm(pos);
if (temp2 ~= 0)
    f = acos(temp1/temp2);
else 
    f = 0;
end
temp3 = dot(pos, vel);
if (temp3 < 0) 
    % f is in different quardrant
    f = 2*pi() - f;
end


temp1 = sqrt ((1- eccent)/(1+eccent)) * tan( f/2);
EccenAnom = 2*atan(temp1);
%EccenAnom =  3.3320;



Minitial = EccenAnom - eccent * sin(EccenAnom);

Mdelta = sqrt(mu/(semiAxis^3)) * (time);

Mfinal = Minitial + Mdelta;
Mfinal = rad2deg(Mfinal);
if (Mfinal < 0)
    %convert to positive degrees
    Mfinal = Mfinal + 360;
end


orbitals = [semiAxis, eccent, inclination, LongAscendingNode, periasis, Mfinal];
end

