function [Ix, Iy, Ixy] = precalc_d(I)
    [m n nr_colors] = size(I);
    Ix=zeros(m,n);
    Iy=zeros(m,n);
    Ixy=zeros(m,n);
    %Convertire
     I=double(I);
      for a=1:m
        for b=1:n
         %Daca nu se indeplineste criteriul
          if (a>=1 && a<=m && b==1) || (a>=1 && a<=m && b==n)
            continue;
          else
           %Calcularea derivatei in raport cu x
          Ix(a,b)=fx(I,b,a);
          endif
        endfor
      endfor
      for a=1:m
        for b=1:n
          %Daca nu se indeplineste criteriul
          if (a==1 && b>=1 && b<=n) || (a==m && b>=1 && b<=n)
            continue;
           else
           %Calcularea derivatei in raport cu y
          Iy(a,b)=fy(I,b,a);
          endif
        endfor
      endfor
     for a=1:m
        for b=1:n
          %Daca nu se indeplineste criteriul
           if (a>=1 && a<=m && b==1) || (a>=1 && a<=m && b==n) || (a==1 && b>=1 && b<=n) || (a==m && b>=1 && b<=n)
             continue;
           else
           %Calcularea derivatei de ordinul 2 mixta
          Ixy(a,b)=fxy(I,a,b);
          endif
        endfor
      endfor
endfunction

