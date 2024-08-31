function r = fxy(f, x, y)
%Calcularea derivatei
     r=(f(x-1,y-1)+f(x+1,y+1)-f(x+1,y-1)-f(x-1,y+1))/4;
endfunction