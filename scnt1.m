function [f]=scnt1(b,z,k);
global N
for i=1:N
f(i)=(k(i)-1)*z(i)/(1+b*(k(i)-1));
end
