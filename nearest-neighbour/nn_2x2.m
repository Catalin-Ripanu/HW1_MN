function out = nn_2x2(f, STEP = 0.1)
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
    n = length(x_int);
    contor=0.5;
    x1 = y1 = 1;
    x2 = y2 = 2;
    out=zeros(n,n);
    contor1=n/2;
    for i = 1 : n
        for j = 1 : n
          %Cel mai apropiat vecin
            Xi = 1 + round((i - contor) / contor1 - contor);
            Yj = 1 + round((j - contor) / contor1 - contor);
            %Calcularea pixelului
           out(i,j)=f(Xi,Yj);
        endfor
    endfor
endfunction
