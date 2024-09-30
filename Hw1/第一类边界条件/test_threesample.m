clc
clear all
format short
x=[0.25, 0.30, 0.39, 0.45, 0.53];
y=[0.500, 0.5477, 0.6245, 0.6708, 0.7280];
y0=0.8 ;          %  S'(x0)=f'(x0)=y0   
yn=0.2;           %  S'(xn)=f'(xn)=yn
x0=0.25:0.01:0.53;
[s,s1,a]=threesimple1(x,y,x0,y0,yn)
figure
plot(x0,s)        %绘制第一边界条件插值函数图像
hold on
grid on
plot(x,y,'o')
xlabel('自变量 X'), ylabel('因变量 Y')
title('插值点与三次样条函数') 
legend('三次样条插值点坐标','插值点')
S=dispf(a)
