function [f]=refal1(b);
global N z k
for i=1:N
f(i)=(k(i)-1)*z(i)/(1+b*(k(i)-1));
end
f=sum(f);

