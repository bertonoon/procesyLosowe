function E = pdf_a()
los = rand(1);
    if (los > 0.5)
        E = -rand(1);
    else
        E = rand(1)*2;
    end
end