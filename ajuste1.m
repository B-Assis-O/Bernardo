T=[0 50 100 150 200]';
k=[573 647 684 690 668]';
[b]=polyfit(T,k,3)


Y=k
g0=ones(1,length(k))'
g1=T
g2=T.^2
g3=T.^3
G=[g0 g1 g2 g3]
GTG=G'*G
GTY=G'*Y
b=GTG\GTY
flipud(b)'


plot(T,k,'*')
Tmod=0:1:200
kmod= b(1,1)+b(2,1)*Tmod+b(3,1)*Tmod.^2+b(4,1)*Tmod.^3
plot(Tmod,kmod)
hold
plot(T,k,'+')








