function [five_point_center_differentiation] = Numerical_differentiation_b(f, true_derivative)
    % f is the function handle
    % true_derivative is the actual derivative value at x=1

    h_values = [1, 0.5, 0.1, 0.01];
    x = 1;

    five_point_center_differentiation = zeros(length(h_values), 2); % [numerical derivative, error]
    for i = 1:length(h_values)
        h = h_values(i);

        % Five point center differentiation formula
        five_point_center_derivative = (- 8*f(x-h) + 8*f(x+h) - f(x+2*h) + f(x-2*h)) / (12*h);
        five_point_center_differentiation(i, 1) = five_point_center_derivative;
        five_point_center_differentiation(i, 2) = abs(five_point_center_derivative - true_derivative);
    end
end
