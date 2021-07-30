% Subrotina para realizar uma interpolação linear

function f_xb=f_intlin(x,fx,xb,p_xa,p_xc)

xa=x(p_xa); % Ponto experimental com valor inferior mais próximo de xb
f_xa=fx(p_xa); % Valor da função no ponto xa: f(xa)
xc=x(p_xc); % Ponto experimental com valor superior mais próximo de xb
f_xc=fx(p_xc); % Valor da função no ponto xc: f(xc)
 
% Resposta: Valor da função no ponto xb: f(xb), obtido por interpolação:
f_xb=f_xa+(((xb-xa)/(xc-xa))*(f_xc-f_xa));

endfunction