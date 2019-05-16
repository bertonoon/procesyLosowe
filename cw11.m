clear; clc;
format long 
format compact 

% cwiczenie 11
% Tu znowu sprawdzanie wlasnosci z wykladu. Gestosc w kazdym punkcie >= 0
% oraz calka od minus niesk. do +niesk musi byc =1.

% Jakiœ du¿y zakres argumentów 
X = -1e2:0.01:1e2;
d = X(10) - X(9);

% 1
Y1 = zeros(size(X));
for i=1:1:length(X) 
    if(X(i) < 0)
        Y1(i) = 0;
    else
        Y1(i) = exp(-X(i))*heaviside(X(i));
    end
end
figure(1)
subplot(2,2,1)
plot(X,Y1);
% calka1 = integral(@cw11_fun1,-1e5,1e5)
calka1 = 0; 
for i=2:1:length(X);
    calka1 = calka1 + 0.5*(Y1(i-1)+Y1(i))*d;
end
calka1

% 2
Y2 = exp(-abs(X));
subplot(2,2,2)
plot(X,Y2);
calka2 = 0; 
for i=2:1:length(X);
    calka2 = calka2 + 0.5*(Y2(i-1)+Y2(i))*d;
end
calka2

% 3
Y3 = zeros(size(X));
for i=1:1:length(X)
    if (abs(X(i)) < 2)
    Y3(i) = 0.75*(X(i)^2-1);
    else 
        Y3(i) = 0;
    end
end
subplot(2,2,3)
plot(X,Y3);
% calka3 = integral(@cw11_fun3,-1e5,1e5)
calka3 = 0; 
for i=2:1:length(X);
    calka3 = calka3 + 0.5*(Y3(i-1)+Y3(i))*d;
end
calka3

% 4
Y4 = zeros(size(X));
for i=1:1:length(X)
    if(X(i) < 0)
        Y4(i) = 0;
    else
        Y4(i) = 2*X(i)*exp(-X(i)^2);
    end
end
subplot(2,2,4)
plot(X,Y4);
% calka4 = integral(@cw11_fun4,-1e5,1e5)
calka4 = 0; 
for i=2:1:length(X);
    calka4 = calka4 + 0.5*(Y4(i-1)+Y4(i))*d;
end
calka4
