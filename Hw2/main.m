function main()
    % 数据点
    x = 1:12;
    y = [0 0 0 0 0 0 1 1 1 1 1 1];

    % 权值
    w1 = [8 8 8 8 8 8 1 1 1 1 1 1];
    w2 = [1 1 1 1 1 1 8 8 8 8 8 8];
    w3 = [1 1 1 1 1 1 1 1 1 1 1 1];
    w10 = [4/27 4/27 4/27 4/27 4/27 4/27 1/54 1/54 1/54 1/54 1/54 1/54];
    w20 = [1/54 1/54 1/54 1/54 1/54 1/54 4/27 4/27 4/27 4/27 4/27 4/27];
    wx = [1 1 1 100 100 100 100 100 100 1 1 1];

    % 拟合多项式次数
    m = 4;

    % 调用polyfit_weighted函数
    pp1 = polyfit_weighted(x, y, m, w1);
    pp2 = polyfit_weighted(x, y, m, w2);
    pp3 = polyfit_weighted(x, y, m, w3);
    pp10 = polyfit_weighted(x, y, m, w10);
    pp20 = polyfit_weighted(x, y, m, w20);
    ppx = polyfit_weighted(x, y, m, wx);

    % 调用Matlab自带的polyfit函数
    pp4 = polyfit(x,y,m);

    % 验证函数的正确性
    disp(pp3);
    disp(pp4);
    disp(pp1);
    disp(pp10);

    % 绘制结果
    figure;
    hold on;
    plot(x, y, 'ko');  % 绘制数据点
    plot(x, polyval(pp10, x), 'r-');  % 绘制拟合曲线
    plot(x, polyval(pp20, x), 'b-');  % 绘制拟合曲线   
    ylim([-0.5,1.5]);  % 设置y轴的取值范围
    hold off;
    legend('Data', 'Fit with w10', 'Fit with w20');
    xlabel('x');
    ylabel('y');

    figure;
    hold on;
    plot(x, y, 'ko');  % 绘制数据点
    plot(x, polyval(ppx, x), 'g-');  % 绘制拟合曲线  
    ylim([-1,2]);  % 设置y轴的取值范围
    hold off;
    legend('Data', 'Fit with w10', 'Fit with w20');
    xlabel('x');
    ylabel('y');

end