% ----------- Merkel ---------------
m= ones(1, 200);
m(8:15) = 6;
o =  ones(size(m));
tic
magnify('merkel.mp4','pmerkel.avi', o,0.5*m,0.7*m,m,m);
toc