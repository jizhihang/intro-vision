function I_out = GEXPAND(I, h)
%function I_out = GEXPAND(I, h) 
% The function receives as input animage I and a generating kernel h, and 
% performs the EXPAND operation on it using the generating kernel.

[r, c, d] = size(I); % Padding the image with rows and columns of zero.
I_out=zeros(2*r,2*c,d);
I_out(2:2:end,2:2:end,:)=I;

I_out=imfilter(I_out,4*h,'replicate','conv'); % Convolving the padded image with the
                                              % generating kernel multiplied by 4.
