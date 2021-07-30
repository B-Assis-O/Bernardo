% Subrotina para realizar uma interpola��o linear

function f_xb=f_intlin(x,fx,xb,p_xa,p_xc)

xa=x(p_xa); % Ponto experimental com valor inferior mais pr�ximo de xb
f_xa=fx(p_xa); % Valor da fun��o no ponto xa: f(xa)
xc=x(p_xc); % Ponto experimental com valor superior mais pr�ximo de xb
f_xc=fx(p_xc); % Valor da fun��o no ponto xc: f(xc)
 
% Resposta: Valor da fun��o no ponto xb: f(xb), obtido por interpola��o:
f_xb=f_xa+(((xb-xa)/(xc-xa))*(f_xc-f_xa));

endfunction