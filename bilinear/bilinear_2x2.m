function out = bilinear_2x2(f, STEP = 0.1)
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
    n = length(x_int);
    x1 = y1 = 1;
    x2 = y2 = 2;
    %Convertire
    f=double(f);
    %Obtinerea coeficientilor
    a=bilinear_coef(f,x1,y1,x2,y2);
     out=zeros(n,n);
    %Umplerea colturilor cu valorile corespunzatoare
    out(1,1)=f(1,1);
    out(1,n)=f(1,2);
    out(n,1)=f(2,1);
    out(n,n)=f(2,2);
    for i = 1 : n
        for j = 1 : n
         %Valoarea pixelului
       out(i,j)=a(1)+x_int(j)*a(2)+y_int(i)*a(3)+x_int(j)*y_int(i)*a(4);
        endfor
    endfor
    out=uint8(out);
endfunction
