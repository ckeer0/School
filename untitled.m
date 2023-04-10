%Charles Keer 
%Controls HW 4


clear 
clc
close all


%Problem 2a. Verify each problem in Part 1 in MATLAB


%Problem 1A
%Find the steady state error of the uncontrolled system. 

%Plot the E(s) equation minus the step response 
Numerator=[1,2,3];
Denomenator=[1,2,8];
TransferFunction=tf(Numerator, Denomenator)
stepplot(TransferFunction,8)
figure



%Problem 1B
%Verify the value for Kp reduces the error by 90%
%Plot the E(s) equation minus the step response 
Numerator=[1,2,3];
Denomenator=[1,2,80];
TransferFunction2=tf(Numerator, Denomenator)
stepplot(TransferFunction2,8)
figure 



%Problem 1C
%Verify the integral controller eliminates the SSE and that the system is
%stable
%Plot the E(s) equation minus the step response 
Numerator=[1,2,3,0];
Denomenator=[1,2,3,5];
TransferFunction3=tf(Numerator, Denomenator)
stepplot(TransferFunction3,100)

%Determine if the system is stable
roots([1,2,3,2.5])
%Since the real part of the root is negative, the system is stable





%2b
%Find a value for KD with a settling time of less than 2 seconds
kd=1.25;

Numerator=[0,5*kd,10,12.5];
Denomenator=[1,2+(5*kd),13,12.5];
TransferFunction4=tf(Numerator, Denomenator)
stepplot(TransferFunction4,10)
stepinfo(TransferFunction4)






