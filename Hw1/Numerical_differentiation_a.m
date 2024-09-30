function [two_point_values, three_point_values] = Numerical_differentiation_a(f, true_derivative)
    % f is the function handle
    % true_derivative is the actual derivative value at x=1
    
    h_values = [0.1, 0.01, 0.001, 0.0001, 0.00001, 0.000001, 0.0000001];
    x = 1;

    two_point_values = zeros(length(h_values), 2); % [numerical derivative, error]
    three_point_values = zeros(length(h_values), 2); % [numerical derivative, error]

    for i = 1:length(h_values)
        h = h_values(i);
        
        % Two point formula
        two_point_derivative = (f(x+h) - f(x)) / h;
        two_point_values(i, 1) = two_point_derivative;
        two_point_values(i, 2) = abs(two_point_derivative - true_derivative);

        % Three point formula
        three_point_derivative = (-3*f(x) + 4*f(x+h) - f(x+2*h)) / (2*h);
        three_point_values(i, 1) = three_point_derivative;
        three_point_values(i, 2) = abs(three_point_derivative - true_derivative);
    end
end
