function [h] = G_Kernel(a)
    w_hat = [ (.25-a/2) 0.25 a 0.25 (0.25-a/2) ];
    h = w_hat' * w_hat;
end