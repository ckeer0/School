clc; clear; close all;



% tolerance



obt = odeset('RelTol',1e-12,'AbsTol',1e-12);



global C A



%% A;C>B



% initial conditions

w1o = .1;

w2o = .1;

w3o = 5;

IC = [w1o w2o w3o];



t = 0:.01:100;



% run ode



[T,w1] = ode45(@eq1,t,IC,obt);



% plot omegas



figure(1);

plot(T,w1(:,1),'r',T,w1(:,2),'g',T,w1(:,3),'b');

ylabel('\omega (rad/s)'); xlabel('Time (sec)');

legend('$\omega_{x}$','$\omega_{y}$','$\omega_{z}$','Interpreter','latex');

title('A;C>B');





%% A;C>B



% initial conditions



w1o = .1;

w2o = .1;

w3o = 5;

IC = [w1o w2o w3o];



t = 0:.01:100;



% run ode



[T,w2] = ode45(@eq2,t,IC,obt);



% plot omegas and quaternions



figure(2);

plot(T,w2(:,1),'r',T,w2(:,2),'g',T,w2(:,3),'b');

ylabel('\omega (rad/s)'); xlabel('Time (sec)');

legend('$\omega_{x}$','$\omega_{y}$','$\omega_{z}$','Interpreter','latex');

title('A;C<B');





%% A<B<C



% initial conditions



w1o = .1;

w2o = 5;

w3o = .1;

IC = [w1o w2o w3o];



t = 0:.01:15;



% run ode



[T,w3] = ode45(@eq3,t,IC,obt);



% plot omegas



figure(3);

plot(T,w3(:,1),'r',T,w3(:,2),'g',T,w3(:,3),'b');

ylabel('\omega (rad/s)'); xlabel('Time (sec)');

legend('$\omega_{x}$','$\omega_{y}$','$\omega_{z}$','Interpreter','latex');

title('A<B<C');



%% Custom Body

% initial conditions





t = 0:.01:20;



w1o = .1;

w2o = .1;

w3o = 5;

IC = [w1o w2o w3o];



% run ode



[T,w4] = ode45(@eq4,t,IC,obt);



% plot omegas



figure(4);

plot(T,w4(:,1),'r',T,w4(:,2),'g',T,w4(:,3),'b');

ylabel('\omega (rad/s)'); xlabel('Time (sec)');

legend('$\omega_{x}$','$\omega_{y}$','$\omega_{z}$','Interpreter','latex');

title('Custom Rigid Body');



% define stability



A = 32464;

B = 19350;

C = 16264;

k = (A-C)*(B-C)/(A*B)*w3o^2;



fprintf('K value of %.4f\n',k);



%% Gravity Gradient Task 6



C = 300; % remember to change

A = 100; % remember to change



mu = 398600; % km^3/s^2

r = 6778; % km



% big omega



Omega = sqrt(mu/r^3);



% initial conditions

%figure(15);plot(T,a,'r',T,b,'g',T,c,'b',T,d,'k');xlabel('Revolutions');ylabel('\theta');legend('15 deg','10 deg','5 deg','0 deg');title('Differing Perturbations');grid on;grid minor;



th0plusdth0 = 5;



w1o = 5;

w2o = 0;

w3o = 0;

q1o = 0;

q2o = 0;

q3o = sind(th0plusdth0/2);    % pert

q4o = cosd(th0plusdth0/2);    % pert

% q3o = 0;

% q4o = 1



IC = [w1o w2o w3o q1o q2o q3o q4o];



t = 0:.01:20;



mu = 398600; % km^3/s^2

r = 6778; % km



% big omega



Omega = sqrt(mu/r^3);



% run ode



[T,qw6] = ode45(@eq6,t,IC,obt);

w6 = qw6(:,1:3);

q6 = qw6(:,4:7);



% calculate angles



C11 = 1-2*q6(:,2).^2-2*q6(:,3).^2;

C21 = 2*(q6(:,1).*q6(:,2)+q6(:,3).*q6(:,4));

C31 = 2*(q6(:,3).*q6(:,1)-q6(:,2).*q6(:,4));

C13 = 2*(q6(:,1).*q6(:,3)+q6(:,2).*q6(:,4));

C12 = 2*(q6(:,2).*q6(:,1)-q6(:,3).*q6(:,4));



prec = wrapTo360(atan2d(C31,C21));

nut = acosd(C11);

spin = wrapTo360(atan2d(C13,C12));



% plot angles and w



figure(5);

plot(T,w6(:,1),'r',T,w6(:,2),'g',T,w6(:,3),'b');

ylabel('w'); xlabel('Revolutions');

legend('$w_{x}$','$w_{y}$','$w_{z}$','Interpreter','latex');

title('Gravity Gradient Omegas');



figure(6);

plot(T,nut);

ylabel('\theta'); xlabel('Revolutions');

title('Gravity Gradient Nutation');



figure(7);

plot(T,prec);

ylabel('\phi'); xlabel('Revolutions');

title('Gravity Gradient Precession');



figure(8);

plot(T,spin);

ylabel('\psi'); xlabel('Revolutions');

title('Gravity Gradient Spin');



% solving eigenvalues



x = C/A-1;

s = w1o - Omega;

y = w1o/Omega - 1;

Q = -(y+x*(1+y));



eigen = [0 -Omega 0 0;Omega 0 0 -6*Omega^2*x;.5 0 0 Q*Omega;0 .5 -Q*Omega 0];

L = eig(eigen);





%% Extra Credit (Thrusters)



% % angular momentum in the y

% H = A*Omega*w6(:,2);

% % Hdot = H;

% for i =1:length(H)

%     if i<length(H)

% %         Hdot(i) = H(i+1) - H(i);

%         Hdot(i) = (H(i+1)-H(i))/(T(i+1)-T(i));

%     end

% end

%

% figure(9);

% plot(T,H,T(1:length(T)-1),Hdot,T,w6(:,2),'g');

% xlabel('Revolutions'); title('Comparing shit'); ylabel('$\frac{kgm^{2}}{s}$ (for $\dot{H}$)','Interpreter','latex');

% legend('H','$\dot{H}$','$w_{y}$','Interpreter','latex');



% run with thrusters



to = 0:.01:2; % only change this, initial conditions are in previous section

t = to(length(to)):.01:t(length(t));

tspan = [to, t];





[TT,qwto] = ode45(@eqt,to,IC,obt);

IC = qwto(length(qwto),:);

[TT,qwt] = ode45(@eq6,t,IC,obt);



QWT = [qwto;qwt];



wt = QWT(:,1:3);

qt = QWT(:,4:7);



C11 = 1-2*qt(:,2).^2-2*qt(:,3).^2;



nutT = acosd(C11);



figure(10);

plot(tspan,wt(:,1),'r',tspan,wt(:,2),'g',tspan,wt(:,3),'b');

hold on

plot(T,w6(:,1),'-',T,w6(:,2),'-',T,w6(:,3),'-');

ylabel('w'); xlabel('Revolutions');

legend('$w_{x}$ Thrust','$w_{y}$ Thrust','$w_{z}$ Thrust','$w_{x}$','$w_{y}$','$w_{z}$','Interpreter','latex');

title('Gravity Gradient Omegas with Aid');

grid on; ylim([0 wt(length(wt),1)]);



figure(11);

plot(tspan,nutT,T,nut);

ylabel('\theta'); xlabel('Revolutions');

title('Gravity Gradient Nutation with Aid');

legend('With thrusters','Natural');

grid on; grid minor;



%% ode45



% A;C>B

function wdot = eq1(t,x)

A = 500;

B = 100;

C = 500;



% to output [w1 w2 w3]

wdot = zeros(3,1);

wdot(1) = -(C-B)*x(2)*(x(3))/A;

wdot(2) = -(A-C)*x(1)*(x(3))/B;

wdot(3) = -(B-A)*x(1)*x(2)/C;

end



% A;C<B

function wdot = eq2(t,x)

A = 100;

B = 500;

C = 100;



% to output [w1 w2 w3]

wdot = zeros(3,1);

wdot(1) = -(C-B)*x(2)*x(3)/A;

wdot(2) = -(A-C)*x(1)*x(3)/B;

wdot(3) = -(B-A)*x(1)*x(2)/C;

end





% A<B<C

function wdot = eq3(t,x)

A = 100;

B = 300;

C = 500;



% to output [w1 w2 w3]

wdot = zeros(3,1);

wdot(1) = -(C-B)*x(2)*x(3)/A;

wdot(2) = -(A-C)*x(1)*x(3)/B;

wdot(3) = -(B-A)*x(1)*x(2)/C;

end



% custom

function wdot = eq4(t,x)

A = 32464;

B = 19350;

C = 16264;



% to output [w1 w2 w3]

wdot = zeros(3,1);

wdot(1) = -(C-B)*x(2)*x(3)/A;

wdot(2) = -(A-C)*x(1)*x(3)/B;

wdot(3) = -(B-A)*x(1)*x(2)/C;

end



% gravity gradient

function dot = eq6(t,x)

global C A





s = x(1) - 1; % spin factor



% C is symmetry axis

sh = C/A-1; % shape factor



% to output [w1 w2 w3 q1 q2 q3 q4 w2thrust]

dot = zeros(7,1);

dot(1) = 0;

dot(2) = 2*pi*(-x(3)*s+sh*(-x(3)*x(1)+12*(x(5)*x(6)-x(4)*x(7))*(x(4)*x(5)+x(6)*x(7))));

dot(3) = 2*pi*(x(2)*s+sh*(x(1)*x(2)-6*(1-2*x(4)^2-2*x(6)^2)*(x(4)*x(5)+x(6)*x(7))));

dot(4) = (pi) * (x(5)*x(3) - x(6)*x(2) + x(7) * (x(1) - s - 1));

dot(5) = (pi) * (x(7)*x(2) - x(4)*x(3) + x(6) * (x(1) - s + 1));

dot(6) = (pi) * (x(4)*x(2) + x(7)*x(3) - x(5) * (x(1) - s + 1));

dot(7) = -(pi) * (x(5)*x(2) + x(6)*x(3) + x(4) * (x(1) - s - 1));

end



% extra credit

function dot = eqt(t,x)

global C A





s = x(1) - 1; % spin factor



% C is symmetry axis

sh = C/A-1; % shape factor



torque = 5544;



% to output [w1 w2 w3 q1 q2 q3 q4 w2thrust]

dot = zeros(7,1);

dot(1) = torque/A;

dot(2) = 2*pi*(-x(3)*s+sh*(-x(3)*x(1)+12*(x(5)*x(6)-x(4)*x(7))*(x(4)*x(5)+x(6)*x(7))));

dot(3) = 2*pi*(x(2)*s+sh*(x(1)*x(2)-6*(1-2*x(4)^2-2*x(6)^2)*(x(4)*x(5)+x(6)*x(7))));

dot(4) = (pi) * (x(5)*x(3) - x(6)*x(2) + x(7) * (x(1) - s - 1));

dot(5) = (pi) * (x(7)*x(2) - x(4)*x(3) + x(6) * (x(1) - s + 1));

dot(6) = (pi) * (x(4)*x(2) + x(7)*x(3) - x(5) * (x(1) - s + 1));

dot(7) = -(pi) * (x(5)*x(2) + x(6)*x(3) + x(4) * (x(1) - s - 1));

end