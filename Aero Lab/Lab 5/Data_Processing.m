clear;
clc;
close all

%load the data into MATLAB
Group1_Pos0=readtable('D:\Github\School\Aero Lab\Lab 5\Data\Sec18\040722_142008_Sec18_Grp1_pos_0.csv');
Group1_Neg0=readtable('D:\Github\School\Aero Lab\Lab 5\Data\Sec18\040722_142654_Sec18_Grp1_neg_0.csv');
Group1_Pos100=readtable('D:\Github\School\Aero Lab\Lab 5\Data\Sec18\040722_143659_Sec18_Grp1_pos_100.csv');
Group1_Neg100=readtable('D:\Github\School\Aero Lab\Lab 5\Data\Sec18\040722_144425_Sec18_Grp1_neg_100.csv');
Group2_Pos0=readtable('D:\Github\School\Aero Lab\Lab 5\Data\Sec18\040722_153011_Sec18_Grp2_pos_0.csv');
Group2_Neg0=readtable('D:\Github\School\Aero Lab\Lab 5\Data\Sec18\040722_153703_Sec18_Grp2_neg_0.csv');
Group2_Pos150=readtable('D:\Github\School\Aero Lab\Lab 5\Data\Sec18\040722_154753_Sec18_Grp2_pos_150.csv');
Group2_Neg150=readtable('D:\Github\School\Aero Lab\Lab 5\Data\Sec18\040722_155535_Sec18_Grp2_neg_150.csv');


%Define Constants
Area=30.94*12;


%Find dynamic pressure for each case
Q_Pos100=Group1_Pos100.DynamicPressure-Group1_Pos0.DynamicPressure;
Q_Neg100=Group1_Neg100.DynamicPressure-Group1_Neg0.DynamicPressure;
Q_Pos150=Group2_Pos150.DynamicPressure-Group2_Pos0.DynamicPressure;
Q_Neg150=Group2_Neg150.DynamicPressure-Group2_Neg0.DynamicPressure;


%Find the CL for each case
LiftForcePos100=Group1_Pos100.WAFBCSide-Group1_Pos0.WAFBCSide;
LiftForceNeg100=Group1_Neg100.WAFBCSide-Group1_Neg0.WAFBCSide;
LiftForcePos150=Group2_Pos150.WAFBCSide-Group2_Pos0.WAFBCSide;
LiftForceNeg150=Group2_Neg150.WAFBCSide-Group2_Neg0.WAFBCSide;


CL_Pos100=LiftForcePos100./(Q_Pos100.*Area);
CL_Neg100=LiftForceNeg100./(Q_Neg100.*Area);
CL_Pos150=LiftForcePos150./(Q_Pos150.*Area);
CL_Neg150=LiftForceNeg150./(Q_Neg150.*Area);


%Find the CD for each case
DragPos100=Group1_Pos100.WAFBCDrag-Group1_Pos0.WAFBCDrag;
DragNeg100=Group1_Neg100.WAFBCDrag-Group1_Neg0.WAFBCDrag;
DragPos150=Group2_Pos150.WAFBCDrag-Group2_Pos0.WAFBCDrag;
DragNeg150=Group2_Pos150.WAFBCDrag-Group2_Neg0.WAFBCDrag;

CD_Pos100=DragPos100./(Q_Pos100.*Area);
CD_Neg100=DragNeg100./(Q_Neg100.*Area);
CD_Pos150=DragPos150./(Q_Pos150.*Area);
CD_Neg150=DragNeg150./(Q_Neg150.*Area);

%Find CL/CD
CL_CDPos100=CL_Pos100./CD_Pos100;
CL_CDNeg100=CL_Neg100./CD_Neg100;
CL_CDPos150=CL_Pos150./CD_Pos150;
CL_CDNeg150=CL_Neg150./CD_Neg150;

%Find CMac/4
MomentPos100=(Group1_Pos100.WAFBCYaw-Group1_Pos0.WAFBCYaw)./(Q_Pos100*Area*12);
MomentNeg100=(Group1_Neg100.WAFBCYaw-Group1_Neg0.WAFBCYaw)./(Q_Neg100*Area*12);
MomentPos150=(Group2_Pos150.WAFBCYaw-Group2_Pos0.WAFBCYaw)./(Q_Pos150*Area*12);
MomentNeg150=(Group2_Neg150.WAFBCYaw-Group2_Neg0.WAFBCYaw)./(Q_Neg150*Area*12);


Moment4Pos100=MomentPos100+CL_Pos100*0.25;
Moment4Neg100=MomentNeg100+CL_Neg100*0.25;
Moment4Pos150=MomentPos150+CL_Pos150*0.25;
Moment4Neg150=MomentNeg150+CL_Neg150*0.25;



%Find Center of pressure vs Alpha
xcpnorm_Pos100=0.25-Moment4Pos100./CL_Pos100;
xcpnorm_Neg100=0.25-Moment4Neg100./CL_Neg100;
xcpnorm_Pos150=0.25-Moment4Pos150./CL_Pos150;
xcpnorm_Neg150=0.25-Moment4Neg150./CL_Neg150;

hold on

%CL vs Alpha
%plot(Group1_Pos100.Yaw,CL_Pos100,"x","Color","B")
%plot(Group1_Neg100.Yaw,CL_Neg100,"x","Color","b")
%plot(Group2_Pos150.Yaw,CL_Pos150,"*",'Color','r')
%plot(Group2_Neg150.Yaw,CL_Neg150,"*",'Color','r')
%xlabel("Alpha")
%ylabel("CL")
%legend("150ft/s Positive","150ft/s Negative","100ft/s Positive","100ft/s Negative","Location","Northwest")

%CD vs Alpha
%plot(Group1_Pos100.Yaw,CD_Pos100,"x","Color","B")
%plot(Group1_Neg100.Yaw,CD_Neg100,"x","Color","B")
%plot(Group2_Pos150.Yaw,CD_Pos150,"*","Color","r")
%plot(Group2_Neg150.Yaw,CD_Neg150,"*","Color","r")
%xlabel("Alpha")
%ylabel("CD")
%legend("100ft/s Positive","100ft/s Negative","150ft/s Positive","150ft/s Negative","Location","North")

%CL vs CD
%plot(CD_Pos100,CL_Pos100,"x","Color","B")
%plot(CD_Neg100,CL_Neg100,"x","Color","B")
%plot(CD_Pos150,CL_Pos150,"*","Color","r")
%plot(CD_Neg150,CL_Neg150,"*","Color","r")
%xlabel("CD")
%ylabel("CL")
%legend("100ft/s Positive","100ft/s Negative","150ft/s Positive","150ft/s Negative","Location","North")

%CL/CD vs Alpha
%plot(Group1_Pos100.Yaw,CL_CDPos100,"x","Color","b")
%plot(Group1_Neg100.Yaw,CL_CDNeg100,"x","Color","b")
%plot(Group2_Pos150.Yaw,CL_CDPos150,"*","Color","r")
%plot(Group2_Neg150.Yaw,CL_CDNeg150,"*","Color","r")
%xlabel("Alpha")
%ylabel("CL/CD")
%legend("100ft/s Positive","100ft/s Negative","150ft/s Positive","150ft/s Negative","Location","Northwest")

%Quarter Cord Pitching Moment vs Alpha
%plot(Group1_Pos100.Yaw,Moment4Pos100,"x","Color","B")
%plot(Group1_Neg100.Yaw,Moment4Neg100,"x","Color","B")
%plot(Group2_Pos150.Yaw,Moment4Pos150,"*","Color","r")
%plot(Group2_Neg150.Yaw,Moment4Neg150,"*","Color","r")
%xlabel("Alpha")
%ylabel("Pitching Moment Coefficient Quarter Cord")
%legend("100ft/s Positive","100ft/s Negative","150ft/s Positive","150ft/s Negative","Location","Northwest")

%Center of pressure vs Alpha
plot(Group1_Pos100.Yaw,xcpnorm_Pos100,"x","Color","B")
plot(Group1_Neg100.Yaw,xcpnorm_Neg100,"x","Color","B")
plot(Group2_Pos150.Yaw,xcpnorm_Pos150,"*","Color","r")
plot(Group2_Neg150.Yaw,xcpnorm_Neg150,"*","Color","r")
xlabel("Alpha")
ylabel("Center of Pressure")
legend("100ft/s Positive","100ft/s Negative","150ft/s Positive","150ft/s Negative","Location","Northwest")


