function R = bilinear_rotate(I, rotation_angle)  
    [m n nr_colors] = size(I);
    I=double(I);
    if nr_colors > 1
        R = -1;
        return
    endif
    %Variabile auxiliare
    a=sin(rotation_angle);
     b=cos(rotation_angle);
R = zeros(m, n);
%Matricea de transformare
K=[b -a;a b];
%Inversa
 L=K^-1;
    for y = 0 : m - 1
        for x = 0 : n - 1
          %Utilizarea transformarii
            B=L*[x;y];
            %Incrementare pentru a trece de la 0 n-1 la 1 n
             B(1,1)++;
             B(2,1)++;
            %Daca punctul se afla in imagine
             if B(1,1) <= n && B(2,1) <= m && B(1,1) >=1 && B(2,1) >=1
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
          else
          %Adaug 0 si merg mai departe
            R(y+1,x+1)=0;
            continue;
            endif
        endfor
    endfor
    R=uint8(R);
endfunction
