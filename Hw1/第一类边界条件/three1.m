function [D,h,A,g,M]=three1(X,Y,y0,yn)
%        自然边界条件的三次样条函数(第一种边界条件)
%        此函数为M值求值函数
%        D,h,A,g,M输出量分别为系数矩阵D，插值宽度h，差商表A，g值,M值 
         n=length(X); 
         A=zeros(n,n);A(:,1)=Y';D=zeros(n,n);g=zeros(n,1);
         for  j=2:n
            for i=j:n
                A(i,j)=(A(i,j-1)- A(i-1,j-1))/(X(i)-X(i-j+1));
            end
         end
         
         for i=1:n-1
             h(i)=X(i+1)-X(i);
         end
         for i=1:n
             D(i,i)=2; 
             D(1,2)=1;
             D(n,n-1)=1;
             if (i==1)
                 g(i,1)=6/h(i)*(A(2,2)-y0); 
             elseif (i==n) 
                     g(i,1)=6/h(i-1)*(yn-A(i,2));
             else 
                 g(i,1)=(6/(h(i-1)+h(i)))*(A(i+1,2)-A(i,2));
             end
           
         end  
         for i=1:n-2
             u(i)=h(i)/(h(i)+h(i+1));
             n(i)=1-u(i);  
             D(i+1,i+2)=n(i);
             D(i+1,i)=u(i);             %改到这里
         end
         M=D\g;
         %M=[0;M;0];         
end
