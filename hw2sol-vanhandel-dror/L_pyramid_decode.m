function I_out = L_pyramid_decode(L,a)
    depth = length(L);
    h = G_Kernel(a); % Create the kernel
    G = cell(depth,1); % Preallocate L for speed
    G{depth} = L{depth}; % The last cell is the full reduced image
    for i = depth-1:-1:1
        G{i} = L{i} + GEXPAND(G{i+1},h);
    end
    I_out = G{1};
end