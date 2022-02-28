%Lab 2 Data Analysis 
clear;
clc;
close all

xc_location=[0,0.025,0.05,0.10,0.20,0.40,0.60,0.80,0.90,1];

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
    CP_Neg_4_fine(i)=(P_Neg_4_fine_port(i)-P_19_Neg_4_degree_fine_mean)/(P_19_Neg_4_degree_fine_mean-P_20_Neg_4_degree_fine_mean)*(-1);
end

%-2 degrees
for i=1:(size(Neg_2_degree_coarse,2)-2)
    P_Neg_2_coarse_port(i)=mean(Neg_2_degree_coarse(:,i));
    CP_Neg_2_coarse(i)=(P_Neg_2_coarse_port(i)-P_19_Neg_2_degree_coarse_mean)/(P_19_Neg_2_degree_coarse_mean-P_20_Neg_2_degree_coarse_mean)*(-1);
end

%Zero Degrees
for i=1:(size(Zero_degree_coarse,2)-2)
    P_zero_coarse_port(i)=mean(Zero_degree_coarse(:,i));
    CP_zero_coarse(i)=(P_zero_coarse_port(i)-P_19_Zero_degree_coarse_mean)/(P_19_Zero_degree_coarse_mean-P_20_Zero_degree_coarse_mean)*(-1);
end


%2 degrees
for i=1:(size(Pos_2_degree_coarse,2)-2)
    P_Pos_2_coarse_port(i)=mean(Pos_2_degree_coarse(:,i));
    CP_Pos_2_coarse(i)=(P_Pos_2_coarse_port(i)-P_19_Pos_2_degree_coarse_mean)/(P_19_Pos_2_degree_coarse_mean-P_20_Pos_2_degree_coarse_mean)*(-1);
end


%4 degrees
for i=1:(size(Pos_4_degree_coarse,2)-2)
    P_Pos_4_coarse_port(i)=mean(Pos_4_degree_coarse(:,i));
    CP_Pos_4_coarse(i)=(P_Pos_4_coarse_port(i)-P_19_Pos_4_degree_coarse_mean)/(P_19_Pos_4_degree_coarse_mean-P_20_Pos_4_degree_coarse_mean)*(-1);
end


Zero_CP_Upper=CP_zero_coarse(1:1:10);
Zero_CP_Lower=[CP_zero_coarse(1,1),CP_zero_coarse(1,11:18),CP_zero_coarse(1,10)];

pos2_CP_Upper=CP_Pos_2_coarse(1:1:10);
pos2_CP_Lower=[CP_Pos_2_coarse(1,1),CP_Pos_2_coarse(1,11:18),CP_Pos_2_coarse(1,10)];


pos4_CP_Upper=CP_Pos_4_coarse(1:1:10);
pos4_CP_Lower=[CP_Pos_4_coarse(1,1),CP_Pos_4_coarse(1,11:18),CP_Pos_4_coarse(1,10)];

neg4_CP_Upper=CP_Neg_4_fine(1:1:10);
neg4_CP_Lower=[CP_Neg_4_fine(1,1),CP_Neg_4_fine(1,11:18),CP_Neg_4_fine(1,10)];

neg2_CP_Upper=CP_Neg_2_coarse(1:1:10);
neg2_CP_Lower=[CP_Neg_2_coarse(1,1),CP_Neg_2_coarse(1,11:18),CP_Neg_2_coarse(1,10)];




cl_zero=trapz(Zero_CP_Upper-Zero_CP_Lower,xc_location);
cl_pos2=trapz(pos2_CP_Upper-pos2_CP_Lower,xc_location);
cl_neg2=trapz(neg2_CP_Upper-neg2_CP_Lower,xc_location);
cl_pos4=trapz(pos4_CP_Upper-pos4_CP_Lower,xc_location);
cl_neg4=trapz(neg4_CP_Upper-neg4_CP_Lower,xc_location);





neg4_le_moment=-trapz((neg4_CP_Upper-neg4_CP_Lower)*0.30/4,xc_location);
neg2_le_moment=-trapz((neg2_CP_Upper-neg2_CP_Lower)*0.30/4,xc_location);
zero_le_moment=-trapz((Zero_CP_Upper-Zero_CP_Lower)*0.30/4,xc_location);
pos2_le_moment=-trapz((pos2_CP_Upper-pos2_CP_Lower)*0.30/4,xc_location);
pos4_le_moment=-trapz((pos4_CP_Upper-pos4_CP_Lower)*0.30/4,xc_location);



neg4_qc_moment=-trapz((neg4_CP_Upper-neg4_CP_Lower)*(0.30/4-0.25),xc_location)
neg2_qc_moment=-trapz((neg2_CP_Upper-neg2_CP_Lower)*(0.30/4-0.25),xc_location)
zero_qc_moment=-trapz((Zero_CP_Upper-Zero_CP_Lower)*(0.30/4-0.25),xc_location)
pos2_qc_moment=-trapz((pos2_CP_Upper-pos2_CP_Lower)*(0.30/4-0.25),xc_location)
pos4_qc_moment=-trapz((pos4_CP_Upper-pos4_CP_Lower)*(0.30/4-0.25),xc_location)


%plot CP Distribution
%plot(xc_location,CP_zero_coarse);
plot(xc_location,pos2_CP_Lower)
hold on 
plot(xc_location,pos2_CP_Upper)
title('CP Distribution 2 AOA')
xlabel("x/c")
ylabel("CP")

