function [EccenVec] = EccCalc(cartesian, mu, H)
%Calcs e Vector that turns into ecentricity
vel = cartesian(4:6);
pos = cartesian(1:3);
posNorm = norm(pos);
unitPos = pos/posNorm;
temp = cross(vel,H);
EccenVec = 1/mu * (temp) - unitPos;

end