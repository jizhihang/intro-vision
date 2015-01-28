close all;
clear all;

m= [1 15*ones(1,9) ones(1,100) ];
%m= [1 15*ones(1,4) ones(1,4) ];
o = ones(size(m));
tic
magnify('baby.mp4','pbaby.avi', m,m,m,m,m);
toc