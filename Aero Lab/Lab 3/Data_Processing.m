clear; 
clc; 
close all 


%Pull in data
data=readtable("022422_145120_Group1_Test1.csv");
finedata=readtable("Combined Data.xlsx");
roughdata=readtable("RoughSphere.csv");

%Set Smooth Variables
qinf_smooth=data.DynamicPressure; 
D_smooth=data.WAFBCDrag;
diameter=8.57; 
Reynolds_smooth=data.ReynoldsNumberPerFt*(8.57/12);

%Set Smooth_Fine Variables
qinf_smooth_fine=finedata.DynamicPressure;
D_smooth_fine=finedata.WAFBCDrag;
Reynolds_smooth_fine=finedata.ReynoldsNumberPerFt*(8.57/12);

%Set Rough Variables
qinf_rough=roughdata.q_psi_;
D_rough=roughdata.D_lbs_;
Reynolds_rough=roughdata.Re; 


%Calculate the CDs for each case
for i=1:16
    Cd_smooth(i)=D_smooth(i)/(qinf_smooth(i)*(diameter^2));
end 


for i=1:20
    Cd_smooth_fine(i)=D_smooth_fine(i)/(qinf_smooth_fine(i)*(diameter^2));
end

for i=1:46
     Cd_rough(i)=D_rough(i)/(qinf_rough(i)*(diameter^2));
end 

%Plot the Course and Rough data for the smooth cylinder
plot(Reynolds_smooth,Cd_smooth,"-x")
title("CD vs Reynolds Number for Smooth Cylinder")
xlabel("Reynolds Number");
ylabel("CD")
hold on
plot(Reynolds_smooth_fine,Cd_smooth_fine, "-x")
legend('Course Data', 'Fine Data');
hold off

%Plot the Rough vs Smooth Cylinder
plot(Reynolds_rough,Cd_rough,"x")
hold on
plot(Reynolds_smooth_fine,Cd_smooth_fine,"x")
title("Smooth Vs Rough Cylinder")
xlabel("Reynolds Number")
ylabel("Cd")

%Calculate the best fit line 
p_smooth=polyfit(Cd_smooth_fine(:,4:12),Reynolds_smooth_fine(4:12,:),2);
xval=linspace(0,0.4,10);
resmooth_crit=polyval(p_smooth,xval);

%Plot the best fit line 
plot(resmooth_crit,xval);   
legend("Rough Sphere", "Smooth Sphere","Line of Best Fit")

%Calculate the critical Reynolds number based on the best fit line. 
reval=polyval(p_smooth,0.3)








