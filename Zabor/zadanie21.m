clear; clc;
r = 0.9;
fi = pi/100;

Aa1 = -r*(exp((1i*pi/fi))+exp((-1i*pi/fi)));
Aa2 = r*r;

r = 0.9;
fi = pi/10;
Ba1 = -r*(exp((1i*pi/fi))+exp((-1i*pi/fi)));
Ba2 = r*r;

r = 0.99;
fi = pi/100;
Ca1 = -r*(exp((1i*pi/fi))+exp((-1i*pi/fi)));
Ca2 = r*r;

r = 0.99;
fi = pi/10;
Da1 = -r*(exp((1i*pi/fi))+exp((-1i*pi/fi)));
Da2 = r*r;

% mac_w = 0;
% mac_H = 0;
% for i=1:1000
%     w = pi*i/1000;
%     H = 1/(1+(Aa1*exp(-1i*w))+(Aa2*((exp(-1i*w))^2)));
%     H = abs(H);
%     H=10*log(H);
%     mac_w = [mac_w w];
%     mac_H = [mac_H H];
% end
% 
% figure
% plot(mac_w, mac_H);

% z = tf('z');
% figure
% H = tf([1 0 0], [1 Aa1 Aa2]);
% bodemag(H);

% figure
% H = tf(1, [1 Ba1 Ba2]);
% bodemag(H);
% figure
% H = tf(1,[Ba1 Ba2 1]);
% bodemag(H);
% 
% figure
% H = tf(1,[Ca1 Ca2 1]);
% bodemag(H);
% 
% figure
% H = tf(1,[Da1 Da2 1]);
% bodemag(H);


for i = 1:1:1000
   w = (pi*i)/1000;
   x(i) = w;
   z = exp(-1i*w);
   
   HA = z^2/(z^2 + Aa1*z + Aa2);
   AA(i) = abs(HA);
   
   HB = z^2/(z^2 + Ba1*z + Ba2);
   AB(i) = abs(HB);
   
   HC = z^2/(z^2 + Ca1*z + Ca2);
   AC(i) = abs(HC);
   
   HD = z^2/(z^2 + Da1*z + Da2);
   AD(i) = abs(HD);
    
end
figure();
subplot(4,1,1)
plot(x,AA);
subplot(4,1,2)
plot(x,AB);
subplot(4,1,3)
plot(x,AC);
subplot(4,1,4)
plot(x,AD);