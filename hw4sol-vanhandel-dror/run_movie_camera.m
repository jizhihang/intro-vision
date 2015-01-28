% ----------- camera ---------------
m= ones(1, 300);
m(4:10) = 50;
o =  ones(size(m));
tic
magnify('camera.mp4','pcamera.avi', o,m,m,m,m);
toc