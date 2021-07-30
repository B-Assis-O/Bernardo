function [Raiz, Iter, Info]=Newton_Raphson(funcao,derivada,x0,Toler,IterMax,Exibe)
x=x0; Iter=0; deltax=1;
if Exibe
  fprintf('\n Cálculo de raiz de equação pelo método de NR\n\n')
  fprintf(' k    x_k       Fx_k      DFx_k       deltax_k\n')
end
while 1
   Fx=eval(funcao);DFx=eval(derivada);
   if Exibe, fprintf('%3i%11.5f%14.5e',Iter,x,Fx,DFx), end
   if (abs(deltax)<= Toler && abs(Fx) <= Toler) || DFx==0 || Iter>=IterMax
     break
   end
   deltax = Fx / DFx; x = x - deltax; Iter = Iter + 1;
   if Exibe, fprintf('%14.5e\n', deltax), end
 end
 Raiz = x;
 % teste de convergência 
 Info = abs(deltax) > Toler || abs(Fx)>Toler;
 if Exibe, fprintf('%\n\nRaiz = %9.5f\nInter = %3i\n', Raiz, Iter, Info), 
 end
 end % newton_raphson


