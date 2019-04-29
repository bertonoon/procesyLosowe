clear;
%% podpunkt 1)
fo=0.01; % Maximum frequency.
t=[-300:1:300]; % Time axis.
m_x = sinc(2*fo*t);

%% podpunkt 2)
N=1000; % Number of realizations.
F=fo*rand(N,1); % Uniform frequencies.
x=cos(2*pi*F*t); % Each row is a
% realization of process.
sample_mean=sum(x)/N; % Compute sample mean.
display(sample_mean)

%% podpunkt 3)
figure(1)
plot(sample_mean)
grid on;

figure(2)
true_mean=sin(2*pi*fo*t)./(2*pi*fo*t); % Compute ensemble
plot(t,sample_mean,'-',t,true_mean,'--') % Plot results.
xlabel('t (seconds)'); ylabel('mu(t)');
legend('sample mean','theoretical mean');
grid on;