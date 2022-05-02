clear;
clc;
close all 

%Import Data into MATLAB
No_Hole_Tunnel_Off_10ms=readtable("D:\Github\School\Aero Lab\DIY Lab\Group1\No Hole Tunnel Off");
No_Hole_Tunnel_On_10ms=readtable("D:\Github\School\Aero Lab\DIY Lab\Group1\No Hole Tunnel ON");
No_Hole_Tunnel_Off_15ms=readtable("D:\Github\School\Aero Lab\DIY Lab\Group1\No Hole Tunnel Off 15ms");
No_Hole_Tunnel_On_15ms=readtable("D:\Github\School\Aero Lab\DIY Lab\Group1\No Hole Tunnel ON 15ms");

Yes_Hole_Tunnel_Off_10ms=readtable("D:\Github\School\Aero Lab\DIY Lab\Group1\Yes Hole Tunnel OFF 10ms");
Yes_Hole_Tunnel_On_10ms=readtable("D:\Github\School\Aero Lab\DIY Lab\Group1\Yes Hole Tunnel ON 10ms");
Yes_Hole_Tunnel_Off_15ms=readtable("D:\Github\School\Aero Lab\DIY Lab\Group1\Yes Hole Tunnel OFF 15ms");
Yes_Hole_Tunnel_On_15ms=readtable("D:\Github\School\Aero Lab\DIY Lab\Group1\Yes Hole Tunnel ON 15ms");


%Define Constants
Cd=0.1372;
windspeed10norm=10;
windspeed15norm=15;
windspeed10=linspace(10,10,10000);
windspeed11=linspace(11,11,10000);
windspeed15=linspace(15,15,10000);
windspeed16=linspace(16,16,10000);


%Calculate the Drag force for each trial run 
Drag_No_Hole_10ms=(No_Hole_Tunnel_On_10ms.DragForce-No_Hole_Tunnel_Off_10ms.DragForce)./Cd;
Drag_No_Hole_15ms=(No_Hole_Tunnel_On_15ms.DragForce-No_Hole_Tunnel_Off_15ms.DragForce)./Cd;
Drag_Yes_Hole_10ms=(Yes_Hole_Tunnel_On_10ms.DragForce-Yes_Hole_Tunnel_Off_10ms.DragForce)./Cd;
Drag_Yes_Hole_15ms=(Yes_Hole_Tunnel_On_15ms.DragForce-Yes_Hole_Tunnel_Off_15ms.DragForce)./Cd;

%Find the mean drag force for each trial run
Avg_Drag_No_Hole_10ms=abs(mean(Drag_No_Hole_10ms));
Avg_Drag_No_Hole_15ms=abs(mean(Drag_No_Hole_15ms));
Avg_Drag_Yes_Hole_10ms=abs(mean(Drag_Yes_Hole_10ms));
Avg_Drag_Yes_Hole_15ms=abs(mean(Drag_Yes_Hole_15ms));


%Calculate the Variance in each drag trial
Drag_Var_no_Hole10ms=var(Drag_No_Hole_10ms,0,"all")
Drag_Var_no_Hole15ms=var(Drag_No_Hole_15ms,0,"all")
Drag_Var_Yes_Hole10ms=var(Drag_Yes_Hole_10ms,0,"all")
Drag_Var_Yes_Hole15ms=var(Drag_Yes_Hole_15ms,0,"all")


%Plot the drag differences
hold on
plot(Avg_Drag_No_Hole_10ms,windspeed10norm,"x")
plot(Avg_Drag_No_Hole_15ms,windspeed15norm,"x")
plot(Avg_Drag_Yes_Hole_10ms,windspeed10norm,"x")
plot(Avg_Drag_Yes_Hole_15ms,windspeed15norm,"x")
xlabel("Drag Force (lb)")
ylabel("Velocity (m/s)")
legend("No Hole 10ms","No Hole 15ms","Yes Hole 10ms","Yes Hole 15ms","Location","best")


%Plot the drag variation 
%hold on
%plot(windspeed10,abs(Drag_No_Hole_10ms),"x")
%plot(windspeed15,abs(Drag_No_Hole_15ms),"x")
%plot(windspeed11,abs(Drag_Yes_Hole_10ms),"x")
%plot(windspeed16,abs(Drag_Yes_Hole_15ms),"x")
%xlabel("Velocity (m/s)")
%ylabel("Variation in Drag force (lb)")
%legend("No Hole 10ms","No Hole 15ms","Yes Hole 10ms","Yes Hole 15ms","Location","best")