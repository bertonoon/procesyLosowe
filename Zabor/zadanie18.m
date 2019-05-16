clear; clc;
close all;
mx = 0;
sigma = 1;
t = 40000;
N = 100;
v = normrnd(mx, sigma, [N, t]);
Y = zeros(N, t);
tau_k = 100;

Y(:, 1) = 0;
for i=1:N
    for j=2:t
        Y(i, j) = 0.99*Y(i, j-1)+v(i, j);
    end
end

macierz_mean = zeros(1, t);
for i=1:t  
    macierz_mean(i) = mean(Y(:, i));
end
mean(macierz_mean)

%1.
tx = linspace(0, t, t);
plot(tx, Y(:, :));

%3.
rxt = zeros(1, tau_k);
suma = 0;
for tau=1:tau_k
   suma = 0;
   for tj=201:t-tau_k
        suma = suma + Y(15, tj)*Y(15, tj+tau);
   end
   rxt(tau) = suma/t;
end

rxe = zeros(1, tau_k);
suma = 0;
for tau=1:tau_k
   suma = 0;
   for n=1:100
        suma = suma + Y(n, 201)*Y(n, 201+tau);
   end
   rxe(tau) = suma/100;
end

rxo = zeros(1, tau_k);
for tau = 1:100
    rxo(tau) = 0.99.^tau/(1 - (0.99*0.99));
end
tau = linspace(1, 100, 100);

figure
plot(tau,rxt)
hold on
plot(tau,rxe,'r')
hold on
plot(tau,rxo,'g')
legend('Po czasie','Po realizacjach','Teorytyczna');


