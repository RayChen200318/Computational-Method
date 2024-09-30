% 主程序

% 参数设置
n_values = 5:21;  % n的取值范围
m1 = 5;
m2 = 5;

% 存储误差的数组
errors = zeros(size(n_values));

% 循环计算不同n值下的误差
for i = 1:length(n_values)
    n = n_values(i);
    x_j = linspace(0, 2*pi, n);  % 配点
    h = 2*pi / n;  % 网格间距

    % 计算近似解
    u_approx = zeros(size(x_j));
    for k = -m1:m2
        u_approx = u_approx + u_hat(k, x_j, @myf) .* exp(1i * k * x_j);
    end

    % 计算误差
    errors(i) = max(abs(u_approx - myu_exact(x_j)));

    % 绘制结果
    figure;
    plot(x_j, real(myu_exact(x_j)), 'b-', x_j, real(u_approx), 'r--');
    xlabel('x');
    ylabel('Real(u)');
    legend('精确解', '近似解');
    title(['n = ', num2str(n)]);
end

% 绘制误差随n的变化
figure;
semilogy(n_values, errors, 'bo-');
xlabel('n');
ylabel('最大误差');
title('误差随n的变化');

