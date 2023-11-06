clear
clc
close all

%Problem 2
num=[1];
denum= [1 1 0];

Gs=tf(num,denum);



K=1.25;


figure(1); stepplot(feedback(1*Gs,1))
figure(2); rlocus(Gs)
sgrid(0.4504,1.5)
figure(3); stepplot(feedback(K*Gs,1))
figure(4); rlocus(feedback(K*Gs,1))
grid
