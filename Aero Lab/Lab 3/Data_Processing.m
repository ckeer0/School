clear; 
clc; 
close all 

data=readtable("022422_145120_Group1_Test1.csv");
qinf_smooth=data.DynamicPressure; 
D_smooth=data.WAFBCDrag;
diameter=8.57; 
Reynolds_smooth=data.ReynoldsNumberPerFt*(8.57/12);


for i=1:16

Cd_smooth(i)=D_smooth(i)/(qinf_smooth(i)*(diameter^2));
end 


plot(Reynolds_smooth,Cd_smooth)
title("CD vs Reynolds Number for Smooth Cylinder")
xlabel("Reynolds Number");
ylabel("CD")