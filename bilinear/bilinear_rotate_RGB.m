function out = bilinear_rotate_RGB(img,angle)
  %Canalul rosu
     red_part=img(:,:,1);
   %Canalul verde
     green_part=img(:,:,2);
   %Canalul albastru
      blue_part=img(:,:,3);
    %Pentru canalul rosu
      R=bilinear_rotate(red_part,angle);
    %Pentru canalul verde
      G=bilinear_rotate(green_part,angle);
     %Pentru canalul albastru
      B=bilinear_rotate(blue_part,angle);
     %Combinarea rezultatelor
      out=cat(3,R,G,B);
endfunction