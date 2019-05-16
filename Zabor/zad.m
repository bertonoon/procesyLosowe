clear; clc;

N = 1000000;           %Dlugosc syngalu
Ns = 100000;           %Dlugosc szumu
[x, fs] = audioread('Dont Feel Right.wma');

x = x(1:N, 1);
s = zeros(Ns, 1);
x = [s; x];
x = x';
[y1, z] = dodaj_szum(x, 24);
y = y1;
% z - szum
% y - sygnal zaszumiony

%Od tego moiejsca dzialamy tylko na sygnale 'y'
% Nsamps = length(s);
% Nsamps = Ns;
% song = audioplayer(y, fs);
% 
% y_fft = abs(fft(s(1:100000)));
% y_fft = y_fft(1:Nsamps/2);                                  %Otrzymany wynik jest odbity wzgledem srodka, wiec bierzemy tylko polowe wyniku
% y_fft = y_fft.*y_fft;
% f = fs*(0:Nsamps/2-1)/Nsamps;
% % y_fft = y_fft/max(y_fft);
% figure(1)
% hold on
% plot(f, y_fft)


%1. Jednym oknem obejmujemy caly szum i liczymy jego FFT
%W efekcie otrzymujemy widmowa gestosc mocy szumu (Sz) i zakladamy, ze jest ona
%taka sama przez caly czas trwanaia sygnalu y

t=0.02;
dlugosc_okna = 880; 

s_fft = abs(fft(y(1:Ns)));
s_fft = s_fft(1:Ns/2);
s_fft = s_fft.*s_fft;
Sz = s_fft/Ns;

liczba_okien = round(Ns/dlugosc_okna);
Szz = 0;
for i=0:liczba_okien
    if i==0
        s1_fft = abs(fft(y(1:dlugosc_okna)));
        s1_fft = s1_fft(1:dlugosc_okna/2);
        s1_fft = s1_fft.*s1_fft;
        Sz1 = s1_fft/dlugosc_okna;
    else
        s1_fft = abs(fft(y(i*dlugosc_okna:(i+1)*dlugosc_okna)));
        s1_fft = s1_fft(1:dlugosc_okna/2);
        s1_fft = s1_fft.*s1_fft;
        Sz1 = s1_fft/dlugosc_okna;
    end
    Szz = Szz+Sz1;
end
Szz = Szz/liczba_okien;

% f = fs*(0:Ns/2-1)/Ns;
% figure(2)
% hold on
% plot(Sz);
% 
% figure(3)
% hold on
% plot(Szz);

X = [];
liczba_okien = round(N/dlugosc_okna);
okno = triang(dlugosc_okna);
okno = okno';
skok = 0.5;

for j=1:1000
    %2.
    %dlugosc_okna = fs*t 
    %fs - czest. probkowania = 44.1 kHz
    %t - wybrany przez nas czas okna ~ 20ms
    
    y_okno = y(Ns+(dlugosc_okna*j):(Ns+dlugosc_okna*(j+1))-1);
    
    y_fft = abs(fft(y_okno));
    y_fft = y_fft(1:dlugosc_okna/2);
    y_fft = y_fft.*y_fft;
    Sy = y_fft/dlugosc_okna;

    %3.
    Sx = Sy - 3*Szz;
    Sx(Sx < 0) = 0; %Wyzerowanie ujemnych wartosci (Sz > Sy)

    %4.
    A = sqrt(Sx./Sy);
    A = [A , fliplr(A)];

    %5.
    Yw = fft(y(Ns+(dlugosc_okna*j):(Ns+dlugosc_okna*(j+1)-1)));
    Xw = A.*Yw;
    xk = ifft(Xw);
    xk = real(xk);
    
%     X = [X(1:(end-(dlugosc_okna/2))), xk];
    
    X = [X, xk];
    
end

Xn = [];
for j=1:skok:300
    temp = okno.*X(dlugosc_okna*j:dlugosc_okna*(j+1)-1);
    Xn = [Xn(1:(end-(dlugosc_okna*(1-skok)))), temp];
    
end

Xn1 = [];
buf = zeros(1, dlugosc_okna);
for j=1:skok:999
    temp = okno.*X(dlugosc_okna*j:dlugosc_okna*(j+1)-1);
    temp = temp + buf;
    Xn1 = [Xn1(1:(end-(dlugosc_okna*(1-skok)))), temp];
    buf = [Xn1(end-dlugosc_okna*(1-skok):end), zeros(1, dlugosc_okna*skok-1)];
end


% odszumione = audioplayer(Xn, fs);

zaszumione = audioplayer(y, fs);

odszumione = audioplayer(Xn1, fs);

% szum = audioplayer(z, fs);

oryginalne = audioplayer(x, fs);
% 
% odszum = audioplayer(y-z, fs);

figure
subplot(3,1,1)
plot(x)
hold on
Xn1 = [zeros(1,Ns), Xn1];
subplot(3,1,2)
plot(Xn1)
subplot(3,1,3)
plot(z)