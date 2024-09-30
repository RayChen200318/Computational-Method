function [s,s1,a]=threesimple1(X,Y,x,y0,yn)
%        三次样条插值函数第一类型代码 
%        
%        根据三次样条参数函数求出的D,h,A,g,M
%        x表示求解插值点函数点，X为已知插值点 

% output:
%        s1表示三次样条插值函数插值点对应的函数值
%        a为分段函数各项系数矩阵
%        s为了画图生成丝滑曲线细化区间点对应的函数值
         [D,h,A,g,M]=three1(X,Y,y0,yn)
         n=length(X); m=length(x);    
         for t=1:m
            for i=1:n-1
               if (x(t)<=X(i+1))&&(x(t)>=X(i))
                  p1=M(i,1)/(6*h(i));
                  p2=M(i+1,1)/(6*h(i));
                  p3=(A(i,1)-M(i,1)/6*(h(i))^2)/h(i);
                  p4=(A(i+1,1)-M(i+1,1)/6*(h(i))^2)/h(i);
                  p(i,:)=[p1,p2,p3,p4];
                  a1=p(i,2)-p(i,1);
                  a2=3*p(i,1)*X(i+1)-3*p(i,2)*X(i);
                  a3=3*p(i,2)*(X(i))^2-3*p(i,1)*(X(i+1))^2+p(i,4)-p(i,3);
                  a4=p(i,1)*(X(i+1))^3-p(i,2)*(X(i))^3+p(i,3)*X(i+1)-p(i,4)*X(i);
                  a(i,:)=[a1,a2,a3,a4];
                  s1(i)=3*a1*(X(i))^2+2*a2*(X(i))+a3;
                  s(t)=p1*(X(i+1)-x(t))^3+p2*(x(t)-X(i))^3+p3*(X(i+1)-x(t))+p4*(x(t)-X(i)); 
                  break;
               else
                  s(t)=0; 
               end
            end
         end         
end
