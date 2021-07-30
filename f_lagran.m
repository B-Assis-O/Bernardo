% Subrotina para realizar uma interpola��o de Lagrange

function f=f_lagran(X,FX,gp,xd,x0)

% Determina��o de xf:
xf=x0+gp; % Posi��o do �ltimo ponto no conjunto de dados original

% Determina��o do novo conjunto de dados (vizinhos mais pr�ximos de xd)
x=X(x0:xf);
fx=FX(x0:xf);
ndados=length(x);

% C�lculo do polin�mio interpolador:
num=1;
den=1;
L=ones((gp+1),1);
P=0;
for i=1:ndados
    for j=1:ndados
        if i~=j
            num=num*(xd-x(j));
            den=den*(x(i)-x(j));
        end
    end
    L(i)=num/den;
    num=1;
    den=1;
    P=P+fx(i)*L(i);
end
f=P;