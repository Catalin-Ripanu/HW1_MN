function out = nn_resize_RGB(img, p, q)
   %Canalul rosu
      red_part= img(:,:,1);
    %Canalul verde
      green_part= img(:,:,2);
    %Canalul albastru
      blue_part=img(:,:,3);
    %Pentru canalul rosu
      R=nn_resize(red_part,p,q);
    %Pentru canalul verde
      G=nn_resize(green_part,p,q);
     %Pentru canalul albastru
      B=nn_resize(blue_part,p,q);
     %Combinarea rezultatelor
       out=cat(3,R,G,B);
endfunction

