%Darba atliko AKSfm-21 gr. stud. Aušra Jonauskaitė
clc;
clear all;
close all;
% Pagrindinė užduotis
%1.Duomenu paruosimas
%įėjime paduodamas 20 skaičių vektorius x
x =[0:1/19:1];
%vienas išėjimas 
y = (1 + 0.6*sin(2*pi*x/0.7) + 0.3*sin(2*pi*x))/2;
figure(1)
plot(x,y,'kx');
grid on;
%2. Tinklo strukturos pasirinkimas (4-8 neuronai) - 6 neuronai
% pirmojo pasleptojo sluoksnio rysiu svoriai
w11_1=rand(1)*0.1;
w21_1=rand(1)*0.1;
w31_1=rand(1)*0.1;
w41_1=rand(1)*0.1;
w51_1=rand(1)*0.1;
w61_1=rand(1)*0.1;
b1_1=rand(1)*0.1;
b2_1=rand(1)*0.1;
b3_1=rand(1)*0.1;
b4_1=rand(1)*0.1;
b5_1=rand(1)*0.1;
b6_1=rand(1)*0.1;
% antrojo sluoksnio (isejimo) rysiu svoriai
w11_2=rand(1)*0.1;
w12_2=rand(1)*0.1;
w13_2=rand(1)*0.1;
w14_2=rand(1)*0.1;
w15_2=rand(1)*0.1;
w16_2=rand(1)*0.1;
b1_2=rand(1)*0.1;
n=0.05;