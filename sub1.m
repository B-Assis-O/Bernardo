function [f]=sub(x)
global a0 a1 a2 a3
f=a0+a1*x+a2*x.^2+a3*x.^3;