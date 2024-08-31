function R = bicubic_resize(I, p, q)
    [m n nr_colors] = size(I);
   %Convertire
    I=double(I);
    R = zeros(p, q);
    if nr_colors > 1
        R = -1;
        return
    endif
    contor6=4;
    %Factorii de scalare tinand cont de interval
    s_x=(q-1)/(n-1);
    s_y=(p-1)/(m-1);
    %Matricea de transformare
    K=[s_x 0;0 s_y];
    %L=K^-1
    L=[1/s_x 0;0 1/s_y];
    %Obtinerea derivatelor
    [Ix Iy Ixy]=precalc_d(I);
    for y = 0 : p - 1
        for x = 0 : q - 1
          %Utilizarea transformarii
            B=L*[x;y];
          %Incrementare pentru a trece de la 0 n-1 la 1 n
             B(1,1)++;
             B(2,1)++;
       %Punctele ce inconjoara punctul calculat anterior
       %Variabile auxiliare
          contor4=B(2,1)-floor(B(2,1));
          contor5=B(1,1)-floor(B(1,1));
         %Coeficientii de interpolare
            Matrix=bicubic_coef(I,Ix,Iy,Ixy,floor(B(1,1)),floor(B(2,1)),ceil(B(1,1)),ceil(B(2,1)));
          %Variabile auxiliare
           contor8=0;
           contor3=1;
          %Ordonarea elementelor in matrice pentru ceea ce urmeaza
           Matrix=Matrix';
          for contor1=1:4
          for contor2=1:4
          val2=contor3-1;  
          val1=val2/contor6;
          %Obtin coordonatele punctului
          X_position = floor(val1);
          Y_position = mod(val2,contor6);
          %Calculez valoarea interpolata ca o suma
          contor8 = contor8 + Matrix(contor1,contor2)*contor4^(X_position)*contor5^(Y_position);
          contor3++;
          endfor
        endfor
        %Introduc valoarea calculata in rezultat
          R(y+1,x+1)=contor8;
        endfor
    endfor
    R=uint8(R);
endfunction