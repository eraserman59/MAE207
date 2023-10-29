function [N] = nodeCalc(H)
%nodeCalc: calculates n from H
K = [0,0,1];
N = cross(K,H);

end