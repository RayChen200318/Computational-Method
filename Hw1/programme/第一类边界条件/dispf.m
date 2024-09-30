function f=dispf(a)   % 输出函数表达式
    syms x;
    f=a(:,1).*x^3+a(:,2).*x^2+a(:,3).*x+a(:,4);
end