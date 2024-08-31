function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
  %Matrice auxiliara 1
     C=[1 0 0 0;1 1 1 1;0 1 0 0;0 1 2 3];
  %Matrice auxiliara 2
     B=[1 1 0 0;0 1 1 1;0 1 0 2;0 1 0 3];
   %Matrice principala
     D=[f(y1,x1) f(y2,x1) Iy(y1,x1) Iy(y2,x1);f(y1,x2) f(y2,x2) Iy(y1,x2) Iy(y2,x2);Ix(y1,x1) Ix(y2,x1) Ixy(y1,x1) Ixy(y2,x1);Ix(y1,x2) Ix(y2,x2) Ixy(y1,x2) Ixy(y2,x2)];
     %Inversele
     C=C^-1;
     B=B^-1;
    %Convertire
     C=double(C);
     B=double(B);
     D=double(D);
    %Rezultatul final
    A=C*D*B;
endfunction