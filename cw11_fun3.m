function [ y] = cw11_fun3( x )
    if (abs(x) < 2)
        y = 0.75*(x.^2-1);
    else 
        y = 0;
    end    
end

