%AE414 Team Project
%Part 2e 
%Authored by Joedouglas Ashton, Charles Keer, Norman Tweed


clc; 
clear; 
close all

%constants
r0 = 6698*10^3;    %meters
g0 = 8.895;        %meters per second squared
mu = 3.986e14;

%ode45 inputs
tspan = linspace(0,(211*24*3600/sqrt(r0/g0)),100000);
xinit = [1 0 1];

%ode45 for part a
[tau,x] = ode45(@diffeq, tspan, xinit);

rho = x(:,1);
a = x(:,2);
b = x(:,3);
aDot = ((b.^2)-rho)./(rho.^3);
t = tau*sqrt(r0/g0);

%plot s/c trajectory (contour plot of rho)
r = rho*r0;
theta = 0;
dt = t(2)-t(1);

for i = 1:length(r)
    omega(i) = sqrt(mu/(r(i)^3));
    dtheta = omega(i)*dt;
    if i == 1
        theta(i) = dtheta(i);
    else
        theta(i) = theta(i-1) + dtheta;
    end
end

for k = 1:length(r)
    x2(k) = r(k)*cos(theta(k));
    y(k) = r(k)*sin(theta(k));
end

figure;
plot(x2, y)
axis equal
grid on
title('Space Craft Trajectory')

%35,786 km
gso = r(end)/1000 %kilometers
v = sqrt(r0*g0)*sqrt(a(end)^2+(rho(end)*(aDot(end)+(1/(rho(end)^2))))) %meters per second
acc = (2.7e-5)*g0;
deltaU = acc*(211*24*3600)/1000

fprintf('It takes 211 days to reach GSO\n')

function dxdt = diffeq(tau,x)

%define the constants
nu = 2.7e-5;

%variables vector
rho = x(1);
a = x(2);
b = x(3);

%differential equations vector
dxdt = zeros(size(x));
dxdt(1) = a;
dxdt(2) = ((b^2)-rho)/(rho^3);  %this is aDot
dxdt(3) = rho*nu;  %this is bDot
end