function [ y] = cw11_fun4( x )
        y = 2*x.*exp(-x.^2).*heaviside(x);  
end
