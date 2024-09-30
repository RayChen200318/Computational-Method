% 定义测试数据
x = [0, 1];
y = [1, 2];
yp = [0.5, 0.5];

% 获取Hermite插值多项式和其系数
[H, coefficients] = Hermite_interpolation(x, y, yp);

% 在某些点上评估Hermite插值多项式
x_test = 0;
y_test = H(x_test);
fprintf('Hermite interpolated value at x = %.2f is y = %.2f\n', x_test, y_test);

% 绘制图形
x_range = linspace(x(1), x(2), 100);
y_range = arrayfun(H, x_range);
figure;
plot(x_range, y_range, 'b-', 'LineWidth', 2); % 插值多项式
hold on;
plot(x, y, 'ro', 'MarkerSize', 8); % 已知数据点
xlabel('x');
ylabel('y');
title('Hermite Interpolation');
legend('Interpolated Curve', 'Data Points');
grid on;
