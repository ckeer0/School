clear;
clc;
close all

%Define the given variables 
num_stages=3;

ISP1=260;
ISP2=330;
ISP3=430;

e1=0.12;
e2=0.20;
e3=0.20;

ge=9.81;

deltaU=9000;

%solve for x 
syms x

eqn= 0==(1/e1*(1-(1/(x*ge*ISP1))))^((ge*ISP1)/deltaU)*(1/e2*(1-(1/(x*ge*ISP2))))^((ge*ISP2)/deltaU)*(1/e3*(1-(1/(x*ge*ISP3))))^((ge*ISP3)/deltaU)-2.71828;
alpha=double(solve(eqn,x))
