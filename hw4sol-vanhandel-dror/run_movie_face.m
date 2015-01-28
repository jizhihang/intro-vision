% ----------- face ---------------
m= ones(1, 301);
m(8:10) = 20;
o =  ones(size(m));
tic
magnify('face.mp4','pface_out.avi', o,o,o,m,m);
toc