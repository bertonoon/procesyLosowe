
function E = pdf_a()
los = rand(1);
    if (los > 0.5)
        E = -rand(1);
    else
        E = rand(1)*2;
    end
end 

N = 100000;
E = zeros(1,N);
for i = 1:N,
   E(i) = pdf_a;
end

%hist(E)
left=-2; width=0.02; right=3;  %istogram i normalizacja
bins=[left:width:right]; 
[yvalues,xvalues]=hist(E,bins);
yvalues=yvalues/(N*width);
bar(xvalues,yvalues);
axis([left right 0 0.6]);

%% pdfb
N = 100000;
E = zeros(1,N);
for i = 1:N,
   E(i) = pdf_b;
end

figure(2)
%hist(E)
left=-2; width=0.02; right=3;  %istogram i normalizacja
bins=[left:width:right]; 
[yvalues,xvalues]=hist(E,bins);
yvalues=yvalues/(N*width);
bar(xvalues,yvalues);
axis([left right 0 1]);