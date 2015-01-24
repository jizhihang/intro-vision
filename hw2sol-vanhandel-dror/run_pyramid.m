function run_pyramid(imfilename,outfilename)
    % Init runtime
    a = 0.6;
    d = 4;
    I_before = im2double(imread(imfilename));
    h = G_Kernel(a);

    L = L_Pyramid(I_before,a,d);
    % for i=1:d; figure; imshow(L{i}); end;

    I_after = L_pyramid_decode(L,a);
    %imshow(I_after);
    
    dispImg = [I_before,I_after];
    figure; imshow(dispImg);
    imwrite(dispImg, outfilename, 'quality',100); 
end

% run_pyramid('ex2/tiger1.bmp','out.jpg');
% run_pyramid('ex2/orange.jpg','out.jpg');
