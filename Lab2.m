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
%w2[1]_1 - svoris einantis is pirmo iejimo [1] i 2 neurona pirmame
%sluoksnyje _1
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
%3. Skaiciuojame tinklo atsaka
%3.1 Pirmojo sluoksnio neuronams
for index = 1:length(x)
    v1_1 = x(index)*x11_1+b1_1;
    v2_1 = x(index)*x21_1+b2_1;
    v3_1 = x(index)*x31_1+b3_1;
    v4_1 = x(index)*x41_1+b4_1;
    v5_1 = x(index)*x51_1+b5_1;
    v6_1 = x(index)*x61_1+b6_1;
    %pritaikoma sigmoidinė aktyvavimo funkcija 
    y1_1 = 1/(1+exp(-v1_1));
    y2_1 = 1/(1+exp(-v2_1));
    y3_1 = 1/(1+exp(-v3_1));
    y4_1 = 1/(1+exp(-v4_1));
    y5_1 = 1/(1+exp(-v5_1));
    y6_1 = 1/(1+exp(-v6_1));
end


