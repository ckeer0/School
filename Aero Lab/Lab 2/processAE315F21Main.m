clc;
clear all;
close all;

% enter the name of the diretory which has the data. It should within the
% directory that this file is in
dirName=fullfile('D:/Github/School/Aero Lab/Lab 2/Raw Data/wake_scan_secNo18/aoa_neg4/');

% fname base
fName='neg4_f';

% iZBtm and iZTop are the first and last points that form the wake. For
% every case you will have to try a couple of values and then iterate 
% to make sure you are correctly identifying the wake. I will attach a
% figure (sampleWake.png) showing the wake for the sample data I used.

% This is the first point of the wake (bottom)
iZBtm=2;
% This is the last point of the wake (top)
iZTop=9;

nPts=8;
% This function puts out several variables for the wake. Please look at the
% function itself for more comments.
[dp,dpSmooth,dpStd,...
    pAtm,TAtm,z,dpInf]=processAE315F21WakeData(dirName,fName,iZTop,iZBtm);

% This plot is only to identify the wake. You need to then use dpSmooth,
% dpInf etc, to do your calculations. Don't include the non-smooth data in
% your main lab note. You can add it to the appendix if you like. Use trapz
% to integrate once you convert dpSmooth and dpInf to velocities. Check the
% above function for units
figure
plot(dp,z,'o-r',dpSmooth,z,'o--k',...
    dpSmooth(iZBtm:iZTop),z(iZBtm:iZTop),'xg')
xlabel('$\delta p$ (in. Pa)','Interpreter','latex')
ylabel('$z$ (m)','Interpreter','latex')
legend('Raw data','Non-wake smoothed data',...
    'wake points (iZBtm to izTop)','Location','NorthOutside')
title('2 AOA')

rhoAtm=mean(pAtm/287/TAtm)

V=sqrt(2.*dpSmooth/rhoAtm)
VInf=sqrt(2.*dpInf/rhoAtm)
D=rhoAtm*trapz(z,V.*(VInf-V))
Cd=D/(0.5*rhoAtm*VInf^2)
% 
