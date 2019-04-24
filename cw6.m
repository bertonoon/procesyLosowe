clear;
N = 10000; %ilosc sampli
F = zeros(1,N);
a = -1; b = 2;
m_E = 1/4; odchyl_E = sqrt(37/48);

for i = 1:N,
    for j = 1:16,
        E = pdf_a();
        F(i) = F(i) + (1/4)*((E - m_E)/odchyl_E);
    end
end
 
%histogram
left=-5; width=0.5; right=5;
bins=[left:width:right];
[yvalues,xvalues]=hist(F,bins);
yvalues=yvalues/(N*width); %NORMALIZACJA
figure(1)
bar(xvalues,yvalues);
axis([min(xvalues) max(xvalues) min(yvalues) max(yvalues) + 0.5]);

% rysowanko gaussa
varg = 1;
mg = 0;

x = -5:0.001:5;
gauspdf = (1/(sqrt(2*pi*varg)))*exp(-((x - mg).^2)/(2*varg));

hold on
plot(x,gauspdf);
axis([-5 5 0 0.5]);
grid on;

clear;
N = 10000;
F = zeros(1,N);
a = -1; b = 1;
m_E = -0.0833; odchyl_E = sqrt(0.4097);

for i = 1:N,
    for j = 1:16,
        E = pdf_b();
        F(i) = F(i) + (1/4)*((E - m_E)/odchyl_E);
    end
end

%histogram
left=-5; width=0.5; right=5;
bins=[left:width:right];
[yvalues,xvalues]=hist(F,bins);
yvalues=yvalues/(N*width); %NORMALIZACJA
figure(2)
bar(xvalues,yvalues);
axis([min(xvalues) max(xvalues) min(yvalues) max(yvalues) + 0.5]);

% rysowanko gaussa
varg = 1;
mg = 0;

x = -5:0.001:5;
gauspdf = (1/(sqrt(2*pi*varg)))*exp(-((x - mg).^2)/(2*varg));

hold on
plot(x,gauspdf);
axis([-5 5 0 0.5]);
grid on;
