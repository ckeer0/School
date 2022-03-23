clear;
clc;
close all

deltaU=5700; %m/s
burn_time=30*24*3600*3; %seconds
alpha_n=10/1000; %kg/kw


ISP=linspace(1,8000,8000);

ue=ISP*9.81; 



ML_MO=exp(-deltaU./ue).*(1+(0.5.*alpha_n.*(ue.^2).*(1./burn_time)))-(0.5.*alpha_n.*(ue.^2).*(1./burn_time));

plot(ISP,ML_MO)
title("ISP vs ML/MO")
xlabel("ISP")
ylabel("ML/MO")
hold on


ML_Max=max(ML_MO)

syms ue

eqn=ML_Max==exp(-deltaU./ue).*(1+(0.5.*alpha_n.*(ue.^2).*(1./burn_time)))-(0.5.*alpha_n.*(ue.^2).*(1./burn_time));

ISP_Max=vpasolve(eqn,ue)/9.81


plot(ISP_Max,ML_Max,'ro')

