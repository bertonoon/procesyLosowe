clear; clc;
format long 
format compact 

% cwiczenie 8 
% Dystrybuanta osiąga wartości od 0 do 1. W dodatku w minus niesk. jest
% zero, a w plus niesk. jest 1. Więc sprawdzamy czy te funkcje mogą
% przekroczyć te wartości.

% Jakiś duży zakres argumentów 
X = -1e6:1:1e6;

% 1 - dobry
Y1 = 0.5 + (1/pi)*atan(X);
figure(1)
subplot(2,2,1)
plot(X,Y1);
% czyli ten jest spoko, bo od 0 do 1 b

% 2 - dobry
Y2 = zeros(size(X));
for i=1:1:length(X)
    if(X(i) < 0)
     Y2(i) = 0;
    else
     Y2(i) = (1-exp(-X(i)));
    end
end
subplot(2,2,2)
plot(X,Y2);

% 3 - ten na bank zły
Y3 = exp((-X).^2);
subplot(2,2,3);
plot(X,Y3);

% 4 - też nie może :(
Y4 = zeros(size(X));
for j=1:length(X),
    if(X(j) < 0)
     Y4(j) = 0;
    else
     Y4(j) = X(j)^2;
    end
end
subplot(2,2,4);
plot(X,Y4);
