function E = pdf_b()
los = rand(1);
    if (los > 0.5)
        E = rand(1);
    else
        E = 0 - sqrt((1-rand(1))*(1)*(1));
        %to ze wzoru z wikipedii na generowanie zmiennych losowych
        %o rozkładzie trójkštnym
    end
end 
