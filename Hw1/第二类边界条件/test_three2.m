x=[75,76,77,78,89,80];
y=[2.768,2.833,2.903,2.979,3.062,3.153];
y0=0;          %  S''(x0)=f''(x0)=y0   
yn=0;          %  S''(xn)=f''(xn)=yn
x0=75:0.1:80;
s=threesimple2(x,y,x0,y0,yn)
plot(x0,s)        %绘制第二边界条件插值函数图像
hold on
grid on
plot(x,y,'o')
axis([74 81 2.7 3.2])
xlabel('自变量 X'), ylabel('因变量 Y')
title('插值点与三次样条函数') 
legend('三次样条插值点坐标','插值点')
