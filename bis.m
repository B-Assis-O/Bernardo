P=20.67;
T=365.5;
be=1.1;
bd=2;
bm=(be+bd)/2;
b0=bm;
fbe=feval('bis11',be);
fbd=feval('bis11',bd);
fbm=feval('bis11',bm);
f0=fbm;
if fbm*fbd<0
be=bm;
else
bd=bm;
end
while abs((fbm)>1e-15)
bm=((be+bd)/2);
b0=[b0,bm];
fbe=feval('bis11',be);
fbd=feval('bis11',bd);
fbm=feval('bis11',bm);
f0=[f0,fbm];
if fbm*fbd<0
be=bm;
else
bd=bm;
end 
end
