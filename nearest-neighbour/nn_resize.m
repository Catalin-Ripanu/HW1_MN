function R = nn_resize(I, p, q)
    [m n nr_colors] = size(I);
    if nr_colors > 1
        R = -1;
        return
    endif
    I=double(I);
    R = zeros(p, q);
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
           %Cel mai apropiat vecin folosind round()
            Xi = round(B(2,1));
            Yj = round(B(1,1));
           %Calcularea pixelului
            R(y+1,x+1) = I(Xi,Yj);
        endfor
    endfor
     R=uint8(R);
endfunction
