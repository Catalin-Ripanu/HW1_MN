function R = bilinear_resize(I, p, q)
    [m n nr_colors] = size(I);
    I=double(I);
    R = zeros(p, q);
    if nr_colors > 1
        R = -1;
        return
    endif
      %Factorii de scalare tinand cont de interval
    s_x=(q-1)/(n-1);
    s_y=(p-1)/(m-1);
     %Matricea de transformare
     K=[s_x 0;0 s_y];
    %L=K^-1
    L=[1/s_x 0;0 1/s_y];
    for y = 0 : p - 1
        for x = 0 : q - 1
      %Utilizarea transformarii
        B=L*[x;y];
       %Incrementare pentru a trece de la 0 n-1 la 1 n
        B(1,1)++;
        B(2,1)++;
       %Punctele ce inconjoara punctul calculat anterior
       %Variabile auxiliare
        contor1=B(2,1)-floor(B(2,1));
        contor2=B(1,1)-floor(B(1,1));
       %Aflarea coeficientilor de interpolare
        IM11 = I(floor(B(2,1)),floor(B(1,1)));
        IM12 = I(ceil(B(2,1)),floor(B(1,1)));
        IM21 = I(floor(B(2,1)),ceil(B(1,1)));
        IM22 = I(ceil(B(2,1)),ceil(B(1,1)));
        %Aflarea pixelului
        R(y+1,x+1) = contor1*contor2*IM22 + (1-contor1)*contor2*IM21 + contor1*(1-contor2)*IM12 + (1-contor1)*(1-contor2)*IM11;
        endfor
    endfor
    R=uint8(R);
endfunction
