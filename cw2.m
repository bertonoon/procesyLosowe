N = 10000;

x = -3:0.1:7; %jakis przedzial
mg = 2;   % mean value
varg = 2; % variance

gaus = mg + sqrt(varg)*randn(N,1);

gauspdf = (1/(sqrt(2*pi*varg)))*exp(-((x - mg).^2)/(2*varg)); %wzor z wikipedii/wykladu

figure(1)

subplot(3,1,1);
plot(gaus);

subplot(3,1,2);
plot(x,gauspdf);
axis([-3 7 0 0.4]);

subplot(3,1,3);
left=-3; width=0.2; right=7;  %istogram i normalizacja slupkow
bins=[left:width:right]; 
[yvalues,xvalues]=hist(gaus,bins);
yvalues=yvalues/(N*width);
bar(xvalues,yvalues);
axis([-3 7 0 0.4]);

hold on 
plot(x,gauspdf,'r');
hold off


a = 2;  % parametr lokalizacji (szczyt funkcji PDF będzie nad tą wartością)
b = 1;  % parametr skali (jak wysoki będzie pik)
gaus2 = randn(N,1);
cauchy = a + b*tan(pi*(gaus2 - 0.5)); % wzór z wikipedii angielskiej(pozycja Quantile w tabelce po prawej)
% cauchy = (randn(N,1))./(randn(N,1));  %sposób z wykładu(ale nie wiedziałem jak ustawić a i b)
cauchypdf = 1./(pi*b*(1 + ((x-a)./b).^2));  %wzór z wikipedii (pozycja PDF w tabelce po prawej) 

figure(2)
subplot(3,1,1);
plot(cauchy);

subplot(3,1,2);
plot(x,cauchypdf);
axis([-3 7 0 0.4]);

subplot(3,1,3);
left=-5; width=0.2; right=7;  %istogram i normalizacja
bins=[left:width:right]; 
[yvalues,xvalues]=hist(cauchy,bins);
yvalues=yvalues/(N*width);
bar(xvalues,yvalues);
axis([left right 0 0.4]);

hold on 
plot(x,cauchypdf,'r');
hold off
