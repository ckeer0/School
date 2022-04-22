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


%Find the CL for each case
LiftForcePos100=Group1_Pos100.WAFBCSide-Group1_Pos0.WAFBCSide;
LiftForceNeg100=Group1_Neg100.WAFBCSide-Group1_Neg0.WAFBCSide;
LiftForcePos150=Group2_Pos150.WAFBCSide-Group2_Pos0.WAFBCSide;
LiftForceNeg150=Group2_Neg150.WAFBCSide-Group2_Neg0.WAFBCSide;

Q_Pos100=Group1_Pos100.DynamicPressure-Group1_Pos0.DynamicPressure;
Q_Neg100=Group1_Neg100.DynamicPressure-Group1_Neg0.DynamicPressure;
Q_Pos150=Group2_Pos150.DynamicPressure-Group2_Pos0.DynamicPressure;
Q_Neg150=Group2_Neg150.DynamicPressure-Group2_Neg0.DynamicPressure;


CL_Pos100=LiftForcePos100./(Q_Pos100.*Area);
CL_Neg100=LiftForceNeg100./(Q_Neg100.*Area);
CL_Pos150=LiftForcePos150./(Q_Pos150.*Area);
CL_Neg150=LiftForceNeg150./(Q_Neg150.*Area);


hold on
plot(Group1_Pos100.Yaw,CL_Pos100,"x","Color","B")
plot(Group1_Neg100.Yaw,CL_Neg100,"x","Color","b")
plot(Group2_Pos150.Yaw,CL_Pos150,"x",'Color','r')
plot(Group2_Neg150.Yaw,CL_Neg150,"x",'Color','r')
xlabel("Alpha")
ylabel("CL")
legend("150ft/s Positive","150ft/s Negative","100ft/s Positive","100ft/s Negative","Location","Northwest")




