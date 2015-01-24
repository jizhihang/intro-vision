function [ I_out ] = image_focus( I1, I2, depth)
   a = 0.6;
   
   L1=L_Pyramid(I1, a, depth);
   L2=L_Pyramid(I2, a, depth);
   L=cell(1,depth+1);
   for i=1:depth+1
       tmp = abs(L1{i}) > abs(L2{i});
       L{i} = (tmp .* L1{i}) + ((1-tmp) .* L2{i});
   end
   %L{depth+1} = L1{depth+1}
   I_out=L_pyramid_decode(L, a);
end