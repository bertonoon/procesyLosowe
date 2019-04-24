N = 10000;
X = 100*rand(N,1);
Y = round(X);
% plot(1:N,X,1:N,Y);

Z = X-Y; %zauwazamy ze blad zaokraglenia moze byc jedynie w przedziale od -0.5 do 0.5
% plot(Z);

var(Z)  % wariancja = 1/12, jak podstawic do wzoru na uniform distribution: 
        % a = -0.5 i b = 0.5, to tez tak wyjdzie
mean(Z) %srednia wychodzi zero, rowniez ze wzoru: (a + b)/2

left=-0.6; width=0.01; right=0.6;
bins=[left:width:right]; 
[yvalues,xvalues]=hist(Z,bins);
yvalues=yvalues/(N*width);
bar(xvalues,yvalues);
axis([min(xvalues) max(xvalues) min(yvalues) max(yvalues)]);

%z powyzszych komentarzy wynika, ze rozklad ten jest rownomierny i mozna
%zastosowac po prostu wzor na niego
a = -0.5;
b = 0.5;
x = -1:0.01:1;
PDF = zeros(1, length(x));
for i=1:length(x)
    if x(i) >= a && x(i) < b
        PDF(i) = 1/(b-a);
    end
end
hold on
plot(x,PDF,'r');
hold off
