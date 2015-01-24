function [I_out] = GREDUCE(I,h)
    I_out = imfilter(I,h,'replicate');
    I_out = I_out(1:2:end,1:2:end,:); % Take every other pixel in the image
end