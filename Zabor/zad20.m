
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


w = [-pi:pi/49.5:pi];
t = 0:1:100;

figure();
subplot(3,1,1)
plot(X);

for u = 1:100
    Px_new(u) = sum(Px((N/100)*(u-1)+1:(N/100)*u))*100/N;
end

subplot(3,1,2)
hold on;

plot(w,Px_new);


for u = 1:10
    Px_new(u) = sum(Px((N/100)*(u-1)+1:(N/100)*u))*100/N;
end

plot(w,Px_new);


if N==10000
    for k = 1:1:N/100
        x = X((k-1)*N/100+1:N/100*100);
        for j = -50:1:50
            suma = 0;
            for t = 1:1:100
                suma = suma + x(t)*exp(-1i*(2*pi*j/100)*t); 
            end
            Px1(j+51,k) = (1/100)*abs(suma)^2;
        end
        Period_wynik(k) = sum(Px1(:,k))/100;

    end
    
    subplot(3,1,3)
    plot(w,Period_wynik);
    ylim([0 5])
end



