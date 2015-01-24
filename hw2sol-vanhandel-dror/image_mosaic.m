function [I_out] = image_mosaic(I1,I2,m,depth)
    a = 0.6;
    h = G_Kernel(a);
    ker = ones(5)/25;
    L_out = cell(1,depth+1);
    L1 = L_Pyramid(I1,a,depth);
    L2 = L_Pyramid(I2,a,depth);
    for i=1:depth+1
            mSmooth = (imfilter(m,ker,'replicate'));
            L_out{i}= (1-mSmooth) .* L1{i} + mSmooth .* L2{i};
            m = GREDUCE(m,h);
    end
    
    I_out = L_pyramid_decode(L_out,a);
end