function [Inhomogenous_differentiation] = Numerical_differentiation_c(f, true_derivative)
    % f is the function handle
    % true_derivative is the actual derivative value at x=1

    h_0 = 0.001;
    h_1 = 0.002;
    x = 1;

    Inhomogenous_differentiation = zeros(1, 2); % [numerical derivative, error]

    % Five point center differentiation formula
    Inhomogenous_derivative =  (h_0*f(x+h_1))/((h_0+h_1)*h_1) - (h_1*f(x-h_0))/((h_0+h_1)*h_0) + ...
        (f(x)*(h_1-h_0))/(h_0*h_1);
    Inhomogenous_differentiation(1, 1) = Inhomogenous_derivative;
    Inhomogenous_differentiation(1, 2) = abs(Inhomogenous_derivative - true_derivative);
end