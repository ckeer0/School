clear;
clc;
close all

burn_time=30*24*3600*3; %seconds
alpha_n=10/1000; %kg/kw
ML_MO=0.7316;


ISP=2960;

ue=ISP*9.81; 


syms deltaU

eqn=ML_MO==exp(-deltaU./ue).*(1+(0.5.*alpha_n.*(ue.^2).*(1./burn_time)))-(0.5.*alpha_n.*(ue.^2).*(1./burn_time));


vpasolve(eqn,deltaU)