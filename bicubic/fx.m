function r = fx(f, x, y)
%Calcularea derivatei
    r=(f(y,x+1)-f(y,x-1))/2;
endfunction