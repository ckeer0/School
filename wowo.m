clear;clc;
% Airfoil Parameters
N = 100; % Number of Points
m = 0; % Maximum Camber
p = 0; % Location of Maximum Camber
t = 12; % Thickness

% Define x-coordinate points
x = linspace(0, 1, N);

% Define camber line
yc = zeros(1, N);
if p == 0
    yc = m/(1-p)^2*(2*p*x-x.^2);
else
    yc(x<p) = m/p^2*(2*p*x(x<p)-x(x<p).^2);
    yc(x>=p) = m/(1-p)^2*((1-2*p)+2*p*x(x>=p)-x(x>=p).^2);
end

% Define thickness distribution
yt = 5*t*(0.2969*sqrt(x)-0.126*x-0.3516*x.^2+0.2843*x.^3-0.1036*x.^4);

% Define upper and lower surfaces
theta = atan2(diff(yc), diff(x));
xu = x - yt.*sin(theta);
xl = x + yt.*sin(theta);
yu = yc + yt.*cos(theta);
yl = yc - yt.*cos(theta);

% Plot the airfoil
figure;
hold on;
plot(xu, yu, 'b');
plot(xl, yl, 'b');
plot([xu fliplr(xl)], [yu fliplr(yl)], 'k');
axis equal;
xlabel('x/c');
ylabel('y/c');
title('NACA 0012 Airfoil');