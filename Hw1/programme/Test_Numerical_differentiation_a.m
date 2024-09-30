% Test the function
f = @(x) exp(x);
true_derivative_at_1 = exp(1);

[two_point, three_point] = Numerical_differentiation_a(f, true_derivative_at_1);
disp('Two Point Formula:');
disp(two_point);
disp('Three Point Formula:');
disp(three_point);