clear;
%% Podpunkt 1)
m_X = [3 4]';
E_X = [5 4; 4 5];

[eigenvec, eigenval] = eig(E_X);

% Get the index of the largest eigenvector
[largest_eigenvec_ind_c, r] = find(eigenval == max(max(eigenval)));
largest_eigenvec = eigenvec(:, largest_eigenvec_ind_c);

% Get the largest eigenvalue
largest_eigenval = max(max(eigenval));

% Get the smallest eigenvector and eigenvalue
if(largest_eigenvec_ind_c == 1)
    smallest_eigenval = max(eigenval(:,2));
    smallest_eigenvec = eigenvec(:,2);
else
    smallest_eigenval = max(eigenval(:,1));
    smallest_eigenvec = eigenvec(1,:);
end

% Calculate the angle between the x-axis and the largest eigenvector
angle = atan2(largest_eigenvec(2), largest_eigenvec(1));

% This angle is between -pi and pi.
% Let's shift it such that the angle is between 0 and 2pi
if(angle < 0)
    angle = angle + 2*pi;
end

% Get the coordinates of the data mean
avg = m_X;

% Get the 95% confidence interval error ellipse
chisquare_val = 2.4477;
theta_grid = linspace(0,2*pi);
phi = angle;
X0=avg(1);
Y0=avg(2);
a=chisquare_val*sqrt(largest_eigenval);
b=chisquare_val*sqrt(smallest_eigenval);

% the ellipse in x and y coordinates 
ellipse_x_r  = a*cos( theta_grid );
ellipse_y_r  = b*sin( theta_grid );

%Define a rotation matrix
R = [ cos(phi) sin(phi); -sin(phi) cos(phi) ];

%let's rotate the ellipse to some angle phi
r_ellipse = [ellipse_x_r;ellipse_y_r]' * R;

% Draw the error ellipse
plot(r_ellipse(:,1) + X0,r_ellipse(:,2) + Y0,'-')
hold on;
grid on;

%Calculating correlation coefficient
S_X = sqrt(E_X(1,1)); %odchylenia standardowe
S_Y = sqrt(E_X(2,2));
S_XY = E_X(1,2);      %kowariancja
corr_coef = S_XY/(S_X*S_Y);
display(corr_coef);

%% Podpunkt 2)
Z = randn(2,1);
Y = eigenvec*sqrtm(eigenval)*Z;
%to i tak na kartce trzeba chyba

%% Podpunkt 3)

X = randn(2,200);
figure(2)
plot(X(1,:),X(2,:),'.r');
grid on;

X = eigenvec*sqrtm(eigenval)*X;
X(1,:) = X(1,:) + m_X(1);
X(2,:) = X(2,:) + m_X(2);
figure(1)
plot(X(1,:),X(2,:),'.r');

