function [pp] = polyfit_weighted(x, y, m, w)

    % 构造加权的设计矩阵
    X = bsxfun(@power, x(:), m:-1:0);
    W = diag(w);  % 构造权重矩阵
    X = W * X;  % 加权设计矩阵
    y = W * y(:);  % 加权目标向量

    % 求解加权最小二乘问题
    pp = X \ y;
    
end

