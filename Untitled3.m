% Duomenu paruosimas
clc
clear all
x=[0.1:1/22:1];
d=((1+0.6*sin(2*pi*x/0.7))+(0.3*sin(2*pi*x)))/2;
figure(1), plot(x,d, 'b*'), grid on
% 2 Pasirinkti struktura
% pirmojo pasleptojo sluoksnio rysiu svoriai
w11_1=rand(1)*0.1;
w21_1=rand(1)*0.1;
w31_1=rand(1)*0.1;
w41_1=rand(1)*0.1;
b1_1=rand(1)*0.1;
b2_1=rand(1)*0.1;
b3_1=rand(1)*0.1;
b4_1=rand(1)*0.1;
% antrojo sluoksnio (isejimo) rysiu svoriai
w11_2=rand(1)*0.1;
w12_2=rand(1)*0.1;
w13_2=rand(1)*0.1;
w14_2=rand(1)*0.1;
b1_2=rand(1)*0.1;
n=0.05;
tic
for i=1:100000
    for indx=1:length(x)
    %   Skaiciuojame tinklo atsaka
    %   3.1 Pirmojo sluoksnio neauronams
        v1_1=x(indx)*w11_1+b1_1;
        v2_1=x(indx)*w21_1+b2_1;
        v3_1=x(indx)*w31_1+b3_1;
        v4_1=x(indx)*w41_1+b4_1;
    %   aktyv f-jos pritaikymas
        y1_1=tanh(v1_1);
        y2_1=tanh(v2_1);
        y3_1=tanh(v3_1);
        y4_1=tanh(v4_1);
    %   3.2 antrojo sluoksnio neuronui
        v1_2=y1_1*w11_2+y2_1*w12_2+y3_1*w13_2+y4_1*w14_2+b1_2;
    %   aktyv f-jos pritaikymas
        y1_2=v1_2;
        y=y1_2;
    %   3.3 skaiciuojame klaida
        e=d(indx)-y;
    %   4. ---------------------rysiu svoriu naujinimas ----------------------
    %   4.1 skaiciuojame klaidos gradienta isejimo sl. neuronui
        delta1_2=e;
    %     4.2 skaiciuojame klaidos gradienta pasleptojo sl. neuronams
        delta1_1=(1-(tanh(y1_1))^2)*delta1_2*w11_2;
        delta2_1=(1-(tanh(y2_1))^2)*delta1_2*w12_2;
        delta3_1=(1-(tanh(y3_1))^2)*delta1_2*w13_2;
        delta4_1=(1-(tanh(y4_1))^2)*delta1_2*w14_2;
    %     4.3 atnaujiname isejimo sl. svorius
        w11_2=w11_2+n*delta1_2*y1_1;
        w12_2=w12_2+n*delta1_2*y2_1;
        w13_2=w13_2+n*delta1_2*y3_1;
        w14_2=w14_2+n*delta1_2*y4_1;
        b1_2=b1_2+n*delta1_2;
    %     4.4 atnaujiname pasleptojo sl. svorius
        w11_1=w11_1+n*delta1_1*x(indx);
        w21_1=w21_1+n*delta2_1*x(indx);
        w31_1=w31_1+n*delta3_1*x(indx);
        w41_1=w41_1+n*delta4_1*x(indx);
        b1_1=b1_1+n*delta1_1;
        b2_1=b2_1+n*delta2_1;
        b3_1=b3_1+n*delta3_1;
        b4_1=b4_1+n*delta4_1;
    end
end
toc
X=[0.1:1/220:1];
Y=zeros(1,length(d));
for indx=1:length(X)
%   Skaiciuojame tinklo atsaka
%   3.1 Pirmojo sluoksnio neauronams
    v1_1=X(indx)*w11_1+b1_1;
    v2_1=X(indx)*w21_1+b2_1;
    v3_1=X(indx)*w31_1+b3_1;
    v4_1=X(indx)*w41_1+b4_1;
%   aktyv f-jos pritaikymas
    y1_1=tanh(v1_1);
    y2_1=tanh(v2_1);
    y3_1=tanh(v3_1);
    y4_1=tanh(v4_1);
%   3.2 antrojo sluoksnio neuronui
    v1_2=y1_1*w11_2+y2_1*w12_2+y3_1*w13_2+y4_1*w14_2+b1_2;
%   aktyv f-jos pritaikymas
    y1_2=v1_2;
    Y(indx)=y1_2;
end
hold on, plot(X,Y,'g+'), hold off
disp('done')