function [H] = angularMomentum(cartesian)
%angularMomentum: Determines H from 6 DOF values, assuming 6 dof
% is in format [x,y,z, xvel, yvel, zvel]
pos = cartesian(1:3);
vel = cartesian(4:6);
H = cross(pos,vel);
end
