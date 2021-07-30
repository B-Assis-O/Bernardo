clear all;
clc;

for Np = 11:10:101

x = linspace(0,2*pi,Np);

f = sin(x);
df = cos(x);

dx = x(2)-x(1);

dfnum = zeros(Np,1);
dfdx_O2 = zeros(Np,1);

for i=1:Np-1
    dfnum(i,1) = (f(i+1)-f(i))/dx;
    if(i < Np-1)
    dfdx_O2(i,1) = (-3*f(i)+4*f(i+1)-f(i+2))/(2*dx);
    endif
end
dfnum(Np,1) = ( f(Np)-f(Np-1) ) /dx;
dfdx_O2(Np-1,1) = (f(Np)-f(Np-1))/dx;
dfdx_O2(Np,1) = (f(Np)-f(Np-1))/dx; 

%plot(x,f, 'r');

plot(x,df,'b');
hold on;
plot(x,dfnum, '-om');
plot(x,dfdx_O2,'-xk');
legend("analitica","1 ordem", "2 ordem")
hold off;
pause(1);

endfor