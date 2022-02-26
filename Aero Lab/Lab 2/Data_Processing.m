%Lab 2 Data Analysis 
clear;
clc;
close all

xc_location=[0,0.025,0.05,0.10,0.20,0.40,0.60,0.80,0.90,1,0.025,0.05,0.10,0.20,0.40,0.60,0.80,0.90];

%Coarse Pressure Distribution Data Load

Zero_degree_coarse=load("oc.dat");
Neg_2_degree_coarse=load("Neg_2c.dat");
%Neg_4_degree_coarse=load("4c.dat");
Pos_2_degree_coarse=load("2c.dat");
Pos_4_degree_coarse=load("4c.dat");

%Fine Pressure Distribution Data Load
Zero_degree_fine=load('0f.dat');
Neg_2_degree_fine=load("Neg_2f.dat");
Neg_4_degree_fine=load("Neg_4f.dat");
Pos_2_degree_fine=load("2f.dat");
Pos_4_degree_fine=load("4f.dat");


%P19 Is Static Pressure, P20 is Total Pressure
%Parse the data for the 19th and 20th columns


%Coarse Data
P_19_Zero_degree_coarse=Zero_degree_coarse(:,19);
P_19_Neg_2_degree_coarse=Neg_2_degree_coarse(:,19);
P_19_Pos_2_degree_coarse=Pos_2_degree_coarse(:,19);
%P_19_Neg_4_degree_coarse=Neg_4_degree_coarse(:,19);
P_19_Pos_4_degree_coarse=Pos_4_degree_coarse(:,19);

P_20_Zero_degree_coarse=Zero_degree_coarse(:,20);
P_20_Neg_2_degree_coarse=Neg_2_degree_coarse(:,20);
P_20_Pos_2_degree_coarse=Pos_2_degree_coarse(:,20);
%P_20_Neg_4_degree_coarse=Neg_4_degree_coarse(:,20);
P_20_Pos_4_degree_coarse=Pos_4_degree_coarse(:,20);



%Fine Data
P_19_Zero_degree_fine=Zero_degree_fine(:,19);
P_19_Neg_2_degree_fine=Neg_2_degree_fine(:,19);
P_19_Pos_2_degree_fine=Pos_2_degree_fine(:,19);
P_19_Neg_4_degree_fine=Neg_4_degree_fine(:,19);
P_19_Pos_4_degree_fine=Neg_4_degree_fine(:,19);

P_20_Zero_degree_fine=Zero_degree_fine(:,20);
P_20_Neg_2_degree_fine=Neg_2_degree_fine(:,20);
P_20_Pos_2_degree_fine=Pos_2_degree_fine(:,20);
P_20_Neg_4_degree_fine=Neg_4_degree_fine(:,20);
P_20_Pos_4_degree_fine=Neg_4_degree_fine(:,20);



%Find the mean of data
%Coarse Data
P_19_Zero_degree_coarse_mean=mean(P_19_Zero_degree_coarse);
P_19_Neg_2_degree_coarse_mean=mean(P_19_Neg_2_degree_coarse);
P_19_Pos_2_degree_coarse_mean=mean(P_19_Pos_2_degree_coarse);
%P_19_Neg_4_degree_coarse_mean=mean(P_19_Neg_4_degree_coarse);
P_19_Pos_4_degree_coarse_mean=mean(P_19_Pos_4_degree_coarse);

P_20_Zero_degree_coarse_mean=mean(P_20_Zero_degree_coarse);
P_20_Neg_2_degree_coarse_mean=mean(P_20_Neg_2_degree_coarse);
P_20_Pos_2_degree_coarse_mean=mean(P_20_Pos_2_degree_coarse);
%P_20_Neg_4_degree_coarse_mean=mean(P_20_Neg_4_degree_coarse);
P_20_Pos_4_degree_coarse_mean=mean(P_20_Pos_4_degree_coarse);

%Fine Data
P_19_Zero_degree_fine_mean=mean(P_19_Zero_degree_fine);
P_19_Neg_2_degree_fine_mean=mean(P_19_Neg_2_degree_fine);
P_19_Pos_2_degree_fine_mean=mean(P_19_Pos_2_degree_fine);
P_19_Neg_4_degree_fine_mean=mean(P_19_Neg_4_degree_fine);
P_19_Pos_4_degree_fine_mean=mean(P_19_Pos_4_degree_fine);

P_20_Zero_degree_fine_mean=mean(P_20_Zero_degree_fine);
P_20_Neg_2_degree_fine_mean=mean(P_20_Neg_2_degree_fine);
P_20_Pos_2_degree_fine_mean=mean(P_20_Pos_2_degree_fine);
P_20_Neg_4_degree_fine_mean=mean(P_20_Neg_4_degree_fine);
P_20_Pos_4_degree_fine_mean=mean(P_20_Pos_4_degree_fine);


%Get Average Pressure for each port and calculate CP
%-4 degrees
for i=1:(size(Neg_4_degree_fine,2)-2)
    P_Neg_4_fine_port(i)=mean(Neg_4_degree_fine(:,i));
    CP_Neg_4_fine(i)=(P_Neg_4_fine_port(i)-P_19_Neg_4_degree_fine_mean)/(P_19_Neg_4_degree_fine_mean-P_20_Neg_4_degree_fine_mean);
end

%-2 degrees
for i=1:(size(Neg_2_degree_coarse,2)-2)
    P_Neg_2_coarse_port(i)=mean(Neg_2_degree_coarse(:,i));
    CP_Neg_2_coarse(i)=(P_Neg_2_coarse_port(i)-P_19_Neg_2_degree_coarse_mean)/(P_19_Neg_2_degree_coarse_mean-P_20_Neg_2_degree_coarse_mean);
end

%Zero Degrees
for i=1:(size(Zero_degree_coarse,2)-2)
    P_zero_coarse_port(i)=mean(Zero_degree_coarse(:,i));
    CP_zero_coarse(i)=(P_zero_coarse_port(i)-P_19_Zero_degree_coarse_mean)/(P_19_Zero_degree_coarse_mean-P_20_Zero_degree_coarse_mean);
end


%2 degrees
for i=1:(size(Pos_2_degree_coarse,2)-2)
    P_Pos_2_coarse_port(i)=mean(Pos_2_degree_coarse(:,i));
    CP_Pos_2_coarse(i)=(P_Pos_2_coarse_port(i)-P_19_Pos_2_degree_coarse_mean)/(P_19_Pos_2_degree_coarse_mean-P_20_Pos_2_degree_coarse_mean);
end


%4 degrees
for i=1:(size(Pos_4_degree_coarse,2)-2)
    P_Pos_4_coarse_port(i)=mean(Pos_4_degree_coarse(:,i));
    CP_Pos_4_coarse(i)=(P_Pos_4_coarse_port(i)-P_19_Pos_4_degree_coarse_mean)/(P_19_Pos_4_degree_coarse_mean-P_20_Pos_4_degree_coarse_mean);
end







%plot CP Distribution
%plot(xc_location,CP_zero_coarse);
plot(xc_location,CP_Pos_2_coarse);



