function [G] = G_Pyramid(I,a,depth)
    h = G_Kernel(a); % Create the kernel
    G = cell(1,depth+1); % Preallocate G for speed
    G{1} = I; % Initialize G with the top level image
    for i = 2:depth+1
        G{i} = GREDUCE(G{i-1},h); % every iteration reduce the image
    end
end