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
    %3.2 Antrojo sluoksnio neuronui
    v1_2 = y1_1*w11_2+y2_1*w12_2+y3_1*w13_2+y4_1*w14_2+y5_1*w15_2+y6_1*w16_2+b1_2;
    %pritaikoma tiesine aktyvavimo funkcija isejime
    %y = y1_2
    y = v1_2;
    %3.3 skaiciuojame klaida
    e = d(index) - y;
    %-----rysiu svoriu atnaujinimas------------
    %3.4 skaiciuojame klaidos gradienta isejimo sl. neuronui
    delta1_2 = e;
    %3.5 skaiciuojame klaidos gradienta pasleptojo sl. neuronams
    delta1_1=y1_1*(1-y1_1)*delta1_2*w11_2;
    delta2_1=y2_1*(1-y2_1)*delta1_2*w12_2;
    delta3_1=y3_1*(1-y3_1)*delta1_2*w13_2;
    delta4_1=y4_1*(1-y4_1)*delta1_2*w14_2;
    delta5_1=y5_1*(1-y5_1)*delta1_2*w15_2;
    delta6_1=y6_1*(1-y6_1)*delta1_2*w16_2;
    %3.6 atnaujiname isejimo sluoksnio rysiu svorius
    w11_2 = w11_2+n*delta1_2*y1_1;
    w12_2 = w12_2+n*delta1_2*y2_1;
    w13_2 = w13_2+n*delta1_2*y3_1;
    w14_2 = w14_2+n*delta1_2*y4_1;
    w15_2 = w15_2+n*delta1_2*y5_1;
    w16_2 = w16_2+n*delta1_2*y6_1;
    b1_2 = b1_2+n*delta1_2;
    %3.7 atnaujiname pasleptojo sluoksnio rysiu svorius
    w11_1 = w11_1+n*delta1_1*x(index);
    w21_1 = w21_1+n*delta2_1*x(index);
    w31_1 = w31_1+n*delta3_1*x(index);
    w41_1 = w41_1+n*delta4_1*x(index);
    w51_1 = w51_1+n*delta5_1*x(index);
    w61_1 = w61_1+n*delta6_1*x(index);
    b1_1 = b1_1+n*delta1_1;
    b2_1 = b2_1+n*delta2_1;
    b3_1 = b3_1+n*delta3_1;
    b4_1 = b4_1+n*delta4_1;
    b5_1 = b5_1+n*delta5_1;
    b6_1 = b6_1+n*delta6_1;
end


