clear all
close all
N = 1000;
a = [-1 -0.9 -0.5 0 0.5 0.9 1]; % a<=1 covXY = a
b = sqrt(1-a.*a); %https://newonlinecourses.science.psu.edu/stat414/node/172/

X = randn(length(a),N);
Z = randn(length(a),N);
Y = zeros(length(a),N);

covXY = zeros(1,length(a));

figure
for i=1:length(a)
    Y(i,:) = (a(i)*X(i,:) + b(i)*Z(i,:));
    temp = cov(X(i,:),Y(i,:));
    covXY(i) = temp(2,1);
    scatter(X(i,:),Y(i,:))
    pause(1);
end