clc;
clear;
close all


R=287;

%load the data into the workspace

%Define Flat Plate Directory
dirName_FP=fullfile('D:\Github\School\Aero Lab\Lab 4\Data\Lab 4\Flat Plate')
fName_10_FP='fp_10mps_';
fName_15_FP='fp_15mps_';

%Define Leading Edge Directory
dirName_LE=fullfile('D:\Github\School\Aero Lab\Lab 4\Data\Lab 4\Leading Edge')
fName_10_LE='le_10mps_le';
fName_15_LE='le_15mps_le';

%Define Trailing Edge Directory
dirName_TE=fullfile('D:\Github\School\Aero Lab\Lab 4\Data\Lab 4\Trailing Edge')
fName_10_TE='te_10mps_te';
fName_15_TE='te_15mps_te';


%Load Flat Plate 10m/s data
for i=1:25
    data_FP_10(i)=load(fullfile(dirName_FP,[fName_10_FP '_' num2str(i) '.mat'])); 
    FP_10_density(i)=data_FP_10(i).pAtm.*3386.38867/(R.*data_FP_10(i).tAtm); %kg/m^3
    FP_10_velocity(i)=sqrt(2*mean(data_FP_10(i).dp*249.0889)/FP_10_density(i));
    FP_10_zcurr(i)=data_FP_10(i).zCurr*0.0254;

end

%Load Flat Plate 15m/s data
for i=1:25
    data_FP_15(i)=load(fullfile(dirName_FP,[fName_15_FP '_' num2str(i) '.mat'])); 
    FP_15_density(i)=data_FP_15(i).pAtm.*3386.38867/(R.*data_FP_15(i).tAtm); %kg/m^3
    FP_15_velocity(i)=sqrt(2*mean(data_FP_15(i).dp*249.0889)/FP_15_density(i));
    FP_15_zcurr(i)=data_FP_15(i).zCurr*0.0254;
end
    
%Load Leading Edge 10m/s data
for i=1:25
    data_LE_10(i)=load(fullfile(dirName_LE,[fName_10_LE '_' num2str(i) '.mat'])); 
    LE_10_density(i)=data_LE_10(i).pAtm.*3386.38867/(R.*data_LE_10(i).tAtm); %kg/m^3
    LE_10_velocity(i)=sqrt(2*mean(data_LE_10(i).dp*249.0889)/LE_10_density(i));
    LE_10_zcurr(i)=data_LE_10(i).zCurr*0.0254;
end

%Load Leading Edge 15m/s data
for i=1:25
    data_LE_15(i)=load(fullfile(dirName_LE,[fName_15_LE '_' num2str(i) '.mat'])); 
    LE_15_density(i)=data_LE_15(i).pAtm.*3386.38867/(R.*data_LE_15(i).tAtm); %kg/m^3
    LE_15_velocity(i)=sqrt(2*mean(data_LE_15(i).dp*249.0889)/LE_15_density(i));
    LE_15_zcurr(i)=data_LE_15(i).zCurr*0.0254;
end

%Load Trailing Edge 10m/s data
for i=1:35
    data_TE_10(i)=load(fullfile(dirName_TE,[fName_10_TE '_' num2str(i) '.mat'])); 
    TE_10_density(i)=data_TE_10(i).pAtm.*3386.38867/(R.*data_TE_10(i).tAtm); %kg/m^3
    TE_10_velocity(i)=sqrt(2*mean(data_TE_10(i).dp*249.0889)/TE_10_density(i));
    TE_10_zcurr(i)=data_TE_10(i).zCurr*0.0254;
end

%Load Trailing Edge 15m/s data
for i=1:35
    data_TE_15(i)=load(fullfile(dirName_TE,[fName_15_TE '_' num2str(i) '.mat'])); 
    TE_15_density(i)=data_TE_15(i).pAtm.*3386.38867/(R.*data_TE_15(i).tAtm); %kg/m^3
    TE_15_velocity(i)=sqrt(2*mean(data_TE_15(i).dp*249.0889)/TE_15_density(i));
    TE_15_zcurr(i)=data_TE_15(i).zCurr*0.0254;
end

%Calculate the U/Ue for each trial
FP_10_UE=FP_10_velocity/mean(FP_10_velocity(20:25));
FP_15_UE=FP_15_velocity/mean(FP_15_velocity(20:25));
LE_10_UE=LE_10_velocity/max(LE_10_velocity);
LE_15_UE=LE_15_velocity/max(LE_15_velocity);
TE_10_UE=TE_10_velocity/mean(TE_10_velocity(30:35));
TE_15_UE=TE_15_velocity/mean(TE_15_velocity(30:35));


%Do a curve fit for each case 
FP_10_fit=polyfit(FP_10_UE(20:25),FP_10_zcurr(20:25),2);
FP_15_fit=polyfit(FP_15_UE(20:25),FP_15_zcurr(20:25),2);
LE_10_fit=polyfit(LE_10_UE(20:25),LE_10_zcurr(20:25),2);
LE_15_fit=polyfit(LE_15_UE(20:25),LE_15_zcurr(20:25),2);
TE_10_fit=polyfit(TE_10_UE(30:35),TE_10_zcurr(30:35),2);
TE_15_fit=polyfit(TE_15_UE(30:35),TE_15_zcurr(30:35),2);

%Find the 99 percent point 
FP_10_z99=abs(polyval(FP_10_fit,0.99*mean(FP_10_UE(20:25))))
FP_15_z99=abs(polyval(FP_15_fit,0.99*mean(FP_15_UE(20:25))))
LE_10_z99=abs(polyval(LE_10_fit,0.99*max(LE_10_UE(20:25))))
LE_15_z99=abs(polyval(LE_15_fit,0.99*mean(LE_15_UE(20:25))))
TE_10_z99=abs(polyval(TE_10_fit,0.99*mean(TE_10_UE(30:35))))
TE_15_z99=abs(polyval(TE_15_fit,0.99*mean(TE_15_UE(30:35))))

%Divide by the 99 pecent point to normalize the x axis
FP_10_zfinal=FP_10_zcurr/FP_10_z99;
FP_15_zfinal=FP_15_zcurr/FP_15_z99;
LE_10_zfinal=LE_10_zcurr/LE_10_z99;
LE_15_zfinal=LE_15_zcurr/LE_15_z99;
TE_10_zfinal=TE_10_zcurr/TE_10_z99;
TE_15_zfinal=TE_15_zcurr/TE_15_z99;



laminar_boundary= @(x)  1-sqrt(-x+1);
turbulent_boundary= @(x) x^(7);
plot(FP_10_UE,FP_10_zfinal,FP_15_UE,FP_15_zfinal,LE_10_UE,LE_10_zfinal,LE_15_UE,LE_15_zfinal,TE_10_UE,TE_10_zfinal,TE_15_UE,TE_15_zfinal)
xlabel("m/s (normalized)")
ylabel("Meters (normalized)")

hold on


fplot(laminar_boundary,[0 1])
fplot(turbulent_boundary, [0 1]) 
legend("10m/s", "15m/s","Laminar Empirical", "Turbulent Emperical","Location","northwest")




