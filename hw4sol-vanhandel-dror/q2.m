close all;
clear all;

m= ones(1, 300);
m(2:34) = 10;
%m= [1 ones(1,4) ];
o =  ones(size(m));
tic
magnify('baby.mp4','pbaby.avi', o,o,m,m,m);
toc