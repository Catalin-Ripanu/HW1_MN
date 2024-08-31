function out = nn_2x2_RGB(img, STEP = 0.1)
  %Canalul rosu
     red_part= img(:,:,1);
   %Canalul verde
      green_part= img(:,:,2);
   %Canalul albastru
      blue_part=img(:,:,3);
   %Pentru canalul rosu
      R=nn_2x2(red_part,STEP);
   %Pentru canalul verde
      G=nn_2x2(green_part,STEP);
   %Pentru canalul albastru
      B=nn_2x2(blue_part,STEP);
    %Combinarea rezultatelor
    out=cat(3,R,G,B);
endfunction
