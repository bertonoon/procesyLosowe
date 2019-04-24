N = 10000;

x = -5:0.1:8;
mg = 2;
varg = 2;
gaus = 2+ sqrt(2)*randn(N,1);
gauspdf = (1/(sqrt(2*pi*varg)))*exp(-((x - mg).^2)/(2*varg));
figure(1)
subplot(3,1,1);
plot(gaus);
subplot(3,1,2);
plot(x,gauspdf);
axis([-3 7 0 0.4]);

subplot(3,1,3);
left=-3; width=0.2; right=7;
bins=[left:width:right]; 
[yvalues,xvalues]=hist(gaus,bins);
yvalues=yvalues/(N*width);
bar(xvalues,yvalues);
axis([-3 7 0 0.4]);
hold on 
plot(x,gauspdf,'r');
hold off


a = 2;
b = 1;
gaus2 = randn(N,1);
cauchy = a + b*tan(pi*(gaus2 - 0.5));
% cauchy = (randn(N,1))./(randn(N,1));
cauchypdf = 1./(pi*b*(1 + ((x-a)./b).^2));
figure(2)
subplot(3,1,1);
plot(cauchy);
subplot(3,1,2);
plot(x,cauchypdf);
axis([-3 7 0 0.4]);

subplot(3,1,3);
left=-5; width=0.2; right=7;
bins=[left:width:right]; 
[yvalues,xvalues]=hist(cauchy,bins);
yvalues=yvalues/(N*width);
bar(xvalues,yvalues);
axis([left right 0 0.4]);
hold on 
plot(x,cauchypdf,'r');
hold off