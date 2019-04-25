clear 
clc 
format compact

mu =2; 
sigma2 =2;
left = -4.5;
width = 1;
right = 14.5;
N = 100;
z=[left-width/2:width/10:right+width/2];

for  licz=1:1:4
    % A  - Uniform PDF
    a = -(sqrt(sigma2*12)-2*mu)/2; 
    b = 2*mu-a;
    A = a+(b-a)*rand(1,100);
    SredniaUniform(licz) = mean(A);
    VarUniform(licz) = var(A);
    % pd = makedist('Uniform','mu',mu,'sigma',sigma2);
    % Ax = -10:0.5:10;
    % Ap = pdf(pd,Ax);
    Ax = -10:0.5:10;
    Ap = pdf('Uniform',z,a,b);

    % B - Gaussa 
    B = mu+sqrt(sigma2)*randn([1,100]);
    
    SredniaGauss(licz) = mean(B);
    VarGauss(licz) = var(B);
    Bx = -10:0.5:10;
    Bp = pdf('Normal',z,mu,sigma2);

    % C - Laplace
    a = mu;
    b = sqrt(sigma2*2);
    U = rand(1,100)-0.5;
    C = 2 - 1*sign(U).*log(1-2*abs(U));
    SredniaLaplace(licz)= mean(C);
    VarLaplace(licz) = var(C);

    Cx = -10:0.5:10;
    for i=1:length(z)
    %     if (C(i) < 0 )
    %         Cy(i) = 0.5*exp(C(i)/b);
    %     else
    %         Cy(i) = 1-0.5*exp(C(i)/b);
    %     end
        Cp(i) = (1/(2*b))*exp(-(abs(z(i)-a))/b);
        
    end
%     Cauchy
    a = 2;  % parametr lokalizacji (szczyt funkcji PDF będzie nad tą wartością)
    b = 1;  % parametr skali (jak wysoki będzie pik)
    gaus2 = randn(N,1);
    cauchy = a + b*tan(pi*(gaus2 - 0.5)); % wzór z wikipedii angielskiej(pozycja Quantile w tabelce po prawej)
    SredniaCauchy(licz) = mean(cauchy);
    VarCauchy(licz) = var(cauchy);
    N = N*10;
    
    
end

disp('Mean')
disp(' 100 | 1000 | 10 000 | 100 000 |')
display(SredniaUniform);
display(SredniaGauss);
display(SredniaLaplace);
display(SredniaCauchy);

disp('Var')
disp(' 100 | 1000 | 10 000 | 100 000 |')
display(VarUniform);
display(VarGauss);
display(VarLaplace);
display(VarCauchy);



