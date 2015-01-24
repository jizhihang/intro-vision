function run_image_focusing(filename1, filename2,outfilename,depth)
    I1 = im2double(imread(filename1));
    I2 = im2double(imread(filename2));
    I_out = image_focus(I1,I2,depth);
    dispImg = [I1 I2 I_out];
    figure; imshow(dispImg);
    imwrite(dispImg, outfilename,'quality',100);
end