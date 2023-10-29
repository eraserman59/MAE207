function [R] = CalcTransformMatrix(orbitalElements)
%UNTITLED4 Assumes oribital elements is 6 values, going 
% [a, e, inclination, longitude ascending, periaspse, mean a
i = orbitalElements(3);
long = orbitalElements(4);
periaspse = orbitalElements(5);

r11 = cos(long)*cos(periaspse) - sin(long)* sin(periaspse)*cos(i);
r12 = -cos(long)* sin(periaspse) - sin(long)* cos(periaspse)*cos(i);
r13 = sin(long) * sin (i);
r21 = sin(long) * cos(periaspse) + cos(long)* sin(periaspse)*cos(i);
r22 = -sin(long) * sin(periaspse) + cos(long)* cos(periaspse)*cos(i);
r23 = -cos(long) * sin(i);
r31 = sin(periaspse) * sin(i);
r32 = cos(periaspse)* sin(i);
r33 = cos(i);

R = [r11,r12,r13;r21,r22,r23;r31,r32,r33];

end