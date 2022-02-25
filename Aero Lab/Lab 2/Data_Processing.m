%Lab 2 Data Analysis 
clear;
clc;
close all



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

%Calculate Dynamic Pressure 
P1=101700; %Atmospheric Pressure 



