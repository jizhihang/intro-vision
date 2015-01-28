close all;
clear all;

m= [1 15*ones(1,9) ones(1,150) ];
%m= [1 ones(1,4) ];
o = ones(size(m));
tic
magnify('baby.mp4','pbaby.avi', o,m,m,m,o);
toc