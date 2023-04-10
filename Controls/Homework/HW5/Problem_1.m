clear
clc
close all

%G=tf([1],[1,17,80,100]);

%root locus of uncompensated 
% rlocus(G);

k = 172;
z = 0.0124;

G_numerator = [k k*z];
G_denominator = [1 17 80 272 2.133]

G = tf(G_numerator,G_denominator)
figure
stepplot(G)
figure
rlocus(G)