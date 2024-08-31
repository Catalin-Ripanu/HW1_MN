function r = fy(f, x, y)
   %Calcularea derivatei
    r=(f(y+1,x)-f(y-1,x))/2;
endfunction