function [Outputs] = Problem1(Inputs, cartFlag, Mu, Time)
%PROBLEM1 does the problem 1
%   Inputs are either cartesian or orbital elements, 
%   Assumption is Orbital elements are in format
%   [a, e, i, cap Omega, little Omega, M] and in degrees
%   Cartesian is in format
%   [x y z xdot, ydot, zdot] in the same units as Mu and Time
%   cartFlag is true if cartesian is input
%   

if (cartFlag == true)
    Outputs = orbitalElementCalc(Inputs,Time, Mu);
else
    Outputs = cartesianCalc(Mu,Inputs,Time);
end


end