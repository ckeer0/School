clear;
clc;
close all


tenms_smooth=load('10mps_smooth.mat');


dp_pascal=ten_ms_smooth.dp*248.84;
patm_pascal=ten_ms_smooth.pAtm*3386.39;
rho=patm_pascal/(287*ten_ms_smooth.TAtm);
q_inf=0.5*rho*(ten_ms_smooth.vel)^2;
Cp(:,:)=dp_pascal(:,:)./q_inf(:,1);

for i=1:19
    Cp_ang(i)=mean(Cp(i,:));
end 

