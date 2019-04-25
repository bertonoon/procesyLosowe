clear; clc;
format long 
format compact 

% cwiczenie 8 
% Dystrybuanta osi¹ga wartoœci od 0 do 1. W dodatku w minus niesk. jest
% zero, a w plus niesk. jest 1. Wiêc sprawdzamy czy te funkcje mog¹
% przekroczyæ te wartoœci. 

% Jakiœ du¿y zakres argumentów 
X = -1e6:1:1e6;

% 1 
Y1 = 0.5 + (1/pi)*atan(X);
figure(1)
subplot(2,2,1)
plot(X,Y1);
% czyli ten jest spoko, bo od 0 do 1 b

% 2 - ten chyba z³y 
Y2 = zeros(size(X));
for i=1:1:length(X)
 Y2(i) = (1-exp(-X(i))).*heaviside(X(i));
end
subplot(2,2,2)
plot(X,Y2);

% 3 - ten na bank z³y
Y3 = exp((-X).^2);
subplot(2,2,3);
plot(X,Y3);

% 4 - te¿ nie mo¿e :(
Y4 = (X.^2).*heaviside(X);
subplot(2,2,4);
plot(X,Y4);
