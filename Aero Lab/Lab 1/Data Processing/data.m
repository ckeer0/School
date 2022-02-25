clear;
clc;
close all


tenms_smooth=load('10mps_smooth.mat');
tenms_rough=load("10mps_rough.mat");
fifteenms_smooth=load("15mps_smooth.mat");
fifteenms_rough=load("15mps_rough.mat");


%10 m/s smooth
dp_pascal_tenms_smooth=tenms_smooth.dp*248.84;
patm_pascal_tenms_smooth=tenms_smooth.pAtm*3386.39;
rho_tenms_smooth=patm_pascal_tenms_smooth/(287*tenms_smooth.TAtm);
q_inf_tenms_smooth=0.5*rho_tenms_smooth*(tenms_smooth.vel)^2;
Cp_10ms_smooth(:,:)=dp_pascal_tenms_smooth(:,:)./q_inf_tenms_smooth(:,1);

for i=1:19
    Cp_ang_10ms_smooth(i)=mean(Cp_10ms_smooth(i,:));
end 

%10 m/s rough
dp_pascal_tenms_rough=tenms_rough.dp*248.84;
patm_pascal_tenms_rough=tenms_rough.pAtm*3386.39;
rho_tenms_rough=patm_pascal_tenms_rough/(287*tenms_rough.TAtm);
q_inf_tenms_rough=0.5*rho_tenms_rough*(tenms_rough.vel)^2;
Cp_10ms_rough(:,:)=dp_pascal_tenms_rough(:,:)./q_inf_tenms_rough(:,1);

for i=1:19
    Cp_ang_10ms_rough(i)=mean(Cp_10ms_rough(i,:));
end 


%15 m/s smooth
dp_pascal_fifteenms_smooth=fifteenms_smooth.dp*248.84;
patm_pascal_fifteenms_smooth=fifteenms_smooth.pAtm*3386.39;
rho_fifteenms_smooth=patm_pascal_fifteenms_smooth/(287*fifteenms_smooth.TAtm);
q_inf_fifteenms_smooth=0.5*rho_fifteenms_smooth*(fifteenms_smooth.vel)^2;
Cp_15ms_smooth(:,:)=dp_pascal_fifteenms_smooth(:,:)./q_inf_fifteenms_smooth(:,1);

for i=1:19
    Cp_ang_15ms_smooth(i)=mean(Cp_15ms_smooth(i,:));
end 

%15 m/s rough
dp_pascal_fifteenms_rough=fifteenms_rough.dp*248.84;
patm_pascal_fifteenms_rough=fifteenms_rough.pAtm*3386.39;
rho_fifteenms_rough=patm_pascal_fifteenms_rough/(287*fifteenms_rough.TAtm);
q_inf_fifteenms_rough=0.5*rho_fifteenms_rough*(fifteenms_rough.vel)^2;
Cp_15ms_rough(:,:)=dp_pascal_fifteenms_rough(:,:)./q_inf_fifteenms_rough(:,1);

for i=1:19
    Cp_ang_15ms_rough(i)=mean(Cp_15ms_rough(i,:));
end 



%Potential CP
j=0;
for i=1:19
potential_cp(i)=1-4*(sind(j))^2;
j=j+10;
end

angle=fifteenms_rough.angSet;



plot(tenms_smooth.angSet,Cp_ang_10ms_smooth,"r*")
hold on
plot(tenms_rough.angSet,Cp_ang_10ms_rough,"g*");
hold on
plot(angle,potential_cp)
hold on




xlabel("Angle (degrees)");
ylabel("Cp");
title("10 m/s");
