%NEWTON RAPHSON em Vanderwalls
global N
N=1;
P=20.67;
T=365.5;
V=1;
V0=V;
f=feval('new1',V,P,T);
f0=f;
df=feval('new2',V,P,T);
V=V-(f/df);
while abs(f) > 1e-15
  V0=[V0,V];
  f=feval('new1',V,P,T);
  df=feval('new2',V,P,T);
  V=V-(f/df);
  f0=[f0,f];
end