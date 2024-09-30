% Test the function
f = @(x) exp(x);
true_derivative_at_1 = exp(1);

results = Numerical_differentiation_c(f, true_derivative_at_1);

disp(results);
