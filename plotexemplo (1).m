x = linspace(1,2*pi,20);

f = sin(x);
df = cos(x);

dx = x(2)-x(1);

dfnum = zeros(20,1);

for i=1:19
    dfnum(i,1) = (f(i+1)-f(i))/dx;
end
dfnum(20,1) = ( f(20)-f(19) ) /dx;

plot(x,f, 'r');
hold on;

plot(x,df,'b');
plot(x,dfnum, 'm');


