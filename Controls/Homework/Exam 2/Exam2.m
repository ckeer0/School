%Charles Keer
%Controls Exam 2
clear
clc 
close all

%Problem 1 

%Inital system step response
num = [1];
denom = [1,5,7]
s = tf(num,denom);
figure
step(s);
title("P1 Uncompensated Step Response")


% Choose a gain of 3.5 for system and plot system 
% with lead compensator design and CL function

num2=[3.5];
denom2 = [1,7.34,14.18];

s2 = tf(num2,denom2);
figure
step(s2);
stepinfo(s2)
title("P1 Compensated Step Response")

%Given that our parameters was a 1.5 s, this system outputs
% a 1.47 settling time, which is within the given parameters. 


%Problem 2

%uncompensated lead root locus 

num3 =[3.5];
denom3 = [1,7.34,10.68];
s3 = tf(num3,denom3);
figure
rlocus(s3);
title("P2 Uncompensated Root Locus")

%Compensated lead-lag root locus 
num4 = [460,69.276];
denom4 = [1,7.35,10.7534,0.1068];
s4 = tf(num4,denom4);
figure
rlocus(s4)
title("P2 Compensated Root Locus")


%Step input with closed loop G(s)
num5 = [460,69.276];
denom5 = [1,7.35,470.7534,69.3828];

s5 = tf(num5,denom5);
figure
step(s5)
stepinfo(s5)

title("P2 Compensated Step Response")
