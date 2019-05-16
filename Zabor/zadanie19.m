t = 200;
N = 100;
stan = 1;
stany = zeros(N, t);
los = rand();
tau_k = 100;

for j=1:N
    % pierwsze losowanie
    if los <= 0.5
        stan = -1;
    else
        stan = 1;
    end
    stany(j, 1) = stan;
  
    for i=2:t
       los = rand();
       if los <= 0.99
           stany(j, i) = stan;
       else
           stan = -stan;
           stany(j, i) = stan;
       end
    end
end

% tx = linspace(1, t, t);
% plot(tx, stany(50, :))

rxt = zeros(1, tau_k);
for tau=1:tau_k
   suma = 0;
   for t_r=1:100
        suma = suma + stany(15, t_r)*stany(15, t_r+tau);
   end
   rxt(tau) = suma/100;
end

rxe = zeros(1, tau_k);
suma = 0;
for tau=1:tau_k
   suma = 0;
   for n=1:N
        suma = suma + stany(n, 8)*stany(n, 8+tau);
   end
   rxe(tau) = suma/100;
end

tau = [1:1:100];

figure
plot(tau,rxt)
hold on
plot(tau,rxe,'r')
legend('Usrednianie po czasie','Usrednianie po realizacjach');