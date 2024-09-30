function [H, coefficients] = Hermite_interpolation(x, y, yp)
    % 输入: x = [x1, x2], y = [y1, y2], yp = [y'1, y'2]
    % 输出: H = Hermite多项式 (作为一个函数句柄)
    %       coefficients = Hermite多项式的各项系数

    % 使用符号计算
    syms x_val;

    % 定义Lagrange基函数
    h_1 = (1 + 2 * (x_val - x(1))/(x(2) - x(1))) * ((x_val - x(2))/(x(1) - x(2))) *((x_val - x(2))/(x(1) - x(2)));
    h_2 = (1 + 2 * (x_val - x(2))/(x(1) - x(2))) * ((x_val - x(1))/(x(2) - x(1))) *((x_val - x(1))/(x(2) - x(1)));

    % 定义Lagrange基函数的导数
    H_1 = (x_val - x(1)) * ((x_val - x(2))/(x(1) - x(2))) *((x_val - x(2))/(x(1) - x(2)));
    H_2 = (x_val - x(2)) * ((x_val - x(1))/(x(2) - x(1))) *((x_val - x(1))/(x(2) - x(1)));

    % 定义Hermite插值多项式
    H_sym = y(1) * h_1 + y(2) * h_2 + yp(1) * H_1 + yp(2) * H_2;

    % 获取Hermite插值多项式的各项系数
    coefficients = coeffs(H_sym, x_val);

    % 将Hermite多项式转换为函数句柄
    H = matlabFunction(H_sym);
end

