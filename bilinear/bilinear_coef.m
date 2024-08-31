function a = bilinear_coef(f, x1, y1, x2, y2)
%Matricea sistemului
A=[1 x1 y1 x1*y1;1 x1 y2 x1*y2;1 x2 y1 x2*y1;1 x2 y2 x2*y2];
%Coloana termenilor liberi  
b=[f(y1,x1);f(y2,x1);f(y1,x2);f(y2,x2)];
%Rezolvarea sistemului
a=A\b;
endfunction
