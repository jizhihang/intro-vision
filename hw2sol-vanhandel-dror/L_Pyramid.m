function [L] = L_Pyramid(I,a,depth)
    h = G_Kernel(a); % Create the kernel
    G = G_Pyramid(I,a,depth+1); % Create the Gaussian pyramid
    L = cell(1,depth+1); % Preallocate L for speed
    L{depth+1} = G{depth+1}; % The last cell is the full reduced image
    for i = 1:depth
        L{i} = G{i} - GEXPAND(G{i+1},h);
    end
end