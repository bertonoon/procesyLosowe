clc;
clear;

N=10000; 
mu=0;
sigma=1;
X=sigma*randn(N,1)+mu;

Px = [];
for j = -50+(100/N):100/N:50
    suma = 0;
    for t = 1:1:N
        suma = suma + X(t)*exp(-1i*(2*pi*j/100)*t); 
    end
    Px = [Px (1/N)*abs(suma)^2];
end

for u = 1:100
    Px_new(u) = sum(Px((N/100)*(u-1)+1:(N/100)*u))*100/N;
end

w = [-pi:pi/49.5:pi];
t = 0:1:100;

figure();
subplot(3,1,1)
plot(Px);
subplot(3,1,2)
plot(ones(100,1));
subplot(3,1,3)
plot(w,Px_new);