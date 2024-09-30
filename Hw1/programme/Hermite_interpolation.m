function [H, coefficients] = Hermite_interpolation(x, y, yp)
    % ����: x = [x1, x2], y = [y1, y2], yp = [y'1, y'2]
    % ���: H = Hermite����ʽ (��Ϊһ���������)
    %       coefficients = Hermite����ʽ�ĸ���ϵ��

    % ʹ�÷��ż���
    syms x_val;

    % ����Lagrange������
    h_1 = (1 + 2 * (x_val - x(1))/(x(2) - x(1))) * ((x_val - x(2))/(x(1) - x(2))) *((x_val - x(2))/(x(1) - x(2)));
    h_2 = (1 + 2 * (x_val - x(2))/(x(1) - x(2))) * ((x_val - x(1))/(x(2) - x(1))) *((x_val - x(1))/(x(2) - x(1)));

    % ����Lagrange�������ĵ���
    H_1 = (x_val - x(1)) * ((x_val - x(2))/(x(1) - x(2))) *((x_val - x(2))/(x(1) - x(2)));
    H_2 = (x_val - x(2)) * ((x_val - x(1))/(x(2) - x(1))) *((x_val - x(1))/(x(2) - x(1)));

    % ����Hermite��ֵ����ʽ
    H_sym = y(1) * h_1 + y(2) * h_2 + yp(1) * H_1 + yp(2) * H_2;

    % ��ȡHermite��ֵ����ʽ�ĸ���ϵ��
    coefficients = coeffs(H_sym, x_val);

    % ��Hermite����ʽת��Ϊ�������
    H = matlabFunction(H_sym);
end

