clear; clc;
 t = linspace(0,2*pi,100);
 theta = deg2rad(45);
 a=3;
 b=1;
 x0 = 3;
 y0 = 4;
 x = x0 + a*cos(t)*cos(theta) - b*sin(t)*sin(theta);
 y = y0 + b*sin(t)*cos(theta) + a*cos(t)*sin(theta);
 figure;
 plot(x,y);
 axis equal;
 
 mx = [3; 4];
 Ex = [5, 4; 4, 5];
 [W, L] = eig(Ex);
 A = W*L^0.5;
 Ey = A*eye(2)*A';
 
 N = 1000;
 Z = randn(2, N);
 Y = A*Z;
 figure
 scatter(Y(1,:), Y(2,:));
 
 
 

 