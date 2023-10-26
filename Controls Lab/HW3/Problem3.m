clc ; clear ; close all ;
 % System dynamics
denom = [1 0.9199 0.956];
num = [0.7648];
G = tf ( num , denom ) ; % plant
H = 1; % unity feedback

% Open loop step function
[y , t ] = step ( G ) ;
stepplot ( G ) ;
% writematrix ([ y , t ] , " unit_step_response . txt ") ;
open_info = stepinfo ( G ) ; % Open loop step information

% Controller - select gains to meet performance specifications
Kp = 15;
Kd = 15;
Ki = 12;
C = pid ( Kp , Kd , Ki ) ; % controller
closed_loop = ( C * G ) /(1+ C * G * H ) ; % Make sure you understand this

% System response with controller
figure (2) ;
step ( closed_loop ) ;
closed_info = stepinfo ( closed_loop ) 