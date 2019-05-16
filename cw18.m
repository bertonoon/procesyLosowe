clear; clc;
format long 
format compact 

Y = zeros(100,400);
X = zeros(100,400);
hold on
for n=1:1:100
    X(n,:) = randn(1,400);
    for i=2:1:400
        Y(n,i) = 0.99*Y(n,i-1)+X(n,i);
    end
    plot(1:1:400,Y(n,:));
end
hold off

Rx = zeros(100,1);

% Krok 3
for i=1:1:100
    temp = 0;
    for j=201:1:300
        temp = temp + Y(1,j)*Y(1,j+i); 
    end
    Rx(i) = (1/100)*temp;
end

% Krok 4
Rx2 = zeros(100,1);

for i=1:1:100
    temp = 0;
    for j =1:1:100
        temp = temp + Y(j,201)*Y(j,201+i);
    end
    Rx2(i) = 0.01*temp;
end

% Krok 5 
i = 1:1:100;
Rx3 = (0.99.^(abs(i)))/(1-(0.99)^2);

figure(2)
plot(i,Rx3,'r-',i,Rx2,'bx');