function [Energy] = EnergyCalc(cartesian,mu)
%E calc
pos = cartesian(1:3);
vel = cartesian(4:6);
temp = dot(vel,vel);
temp2 = norm(pos);
Energy = .5 * temp - (mu/temp2);
end