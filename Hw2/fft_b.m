% 定义参数
n = 10; % 节点数
x = linspace(0, 2*pi, n+1); % 在[0, 2*pi]范围内等距取点
x = x(1:n); % 删除最后一个点以避免重复
f = cos(2*x); % 定义函数f(x)

% 执行FFT
Y = fft(f);

% 计算m1和m2
m1 = floor(n / 2);
m2 = floor((n - 1) / 2);

% 初始化Tilde c_k数组
Tilde_c_k = zeros(1, n);

% 填充Tilde c_k数组
for k = -m1:m2
    if k >= 0
        Tilde_c_k(k + 1) = Y(k + 1) / n; % 当0<=k<=m2时
    else
        Tilde_c_k(k + n + 1) = Y(k + n + 1) / n; % 当-m1<=k<0时
    end
end

% 输出Tilde c_k
disp('Tilde c_k coefficients:');
disp(Tilde_c_k);
