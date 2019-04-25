function [ y] = cw11_fun1( x )
    y = exp(-x).*heaviside(x);
end

