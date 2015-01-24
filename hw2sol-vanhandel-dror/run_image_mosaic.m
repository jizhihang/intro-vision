function run_image_mosaic(filename1, filename2, maskfilename, outfilename)
    %filenames = {'ex2/orange.jpg' 'ex2/apple.jpg' 'ex2/orangapple_m.bmp'};
    filenames = {filename1,filename2,maskfilename};
    I1 = im2double(imread(filenames{1}));
    I2 = im2double(imread(filenames{2}));
    m(:,:,1) = im2double(imread(filenames{3}));
    m(:,:,2) = m(:,:,1);
    m(:,:,3) = m(:,:,1);
    I_out = image_mosaic(I1,I2,m,4);
    
    figure; imshow([I1 I2 ; m I_out]);
    imwrite([I1 I2 ; m I_out], outfilename,'quality',100);
end