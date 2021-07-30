% Subrotina para realizar uma interpolação de Lagrange

function f=f_lagran(X,FX,gp,xd,x0)

% Determinação de xf:
xf=x0+gp; % Posição do último ponto no conjunto de dados original

% Determinação do novo conjunto de dados (vizinhos mais próximos de xd)
x=X(x0:xf);
fx=FX(x0:xf);
ndados=length(x);

% Cálculo do polinômio interpolador:
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