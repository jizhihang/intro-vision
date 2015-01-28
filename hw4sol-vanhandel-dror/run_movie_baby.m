% ----------- baby ---------------
m= ones(1, 300);
m(2:20) = 20;
o =  ones(size(m));
tic
magnify('baby.mp4','pbaby.avi', o,0.5*m,0.7*m,0.8*m,m);
toc