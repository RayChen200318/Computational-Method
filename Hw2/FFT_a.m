% 定义参数
n = 8; % 节点数
x = linspace(0, 2*pi, n+1); % 在[0, 2*pi]范围内等距取点
x = x(1:n); % 删除最后一个点以避免重复
f = sin(x) + exp(x); % 定义函数f(x)

% 初始化c_k数组
c_k = zeros(1, n);

% 计算c_k系数
for k = 0:(n-1)
    sum = 0;
    for j = 1:n
        sum = sum + f(j) * exp(-1i * 2 * pi * k * (j-1) / n);
    end
    c_k(k+1) = sum / n;
end

% 输出c_k系数
disp('c_k coefficients:');
disp(c_k);

% 使用fft进行验证
Y = fft(f);

% 输出fft的结果进行对比
disp('FFT result (adjusted):');
disp(Y / n); % 调整fft的结果以匹配c_k的定义

% 验证 ifft(fft(f)) = f
f_reconstructed = ifft(Y);

% 输出重构的f和原始的f进行比较
disp('Original f:');
disp(f);
disp('Reconstructed f:');
disp(f_reconstructed);
