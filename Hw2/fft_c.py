import numpy as np
import matplotlib.pyplot as plt

def compute_fourier_coefficients(f, m1, m2, n):
    """计算傅立叶系数"""
    x = np.linspace(0, 2*np.pi, n, endpoint=False)
    f_values = f(x)
    f_coeffs = np.zeros(m2 - m1 + 1, dtype=complex)
    for k in range(m1, m2 + 1):
        f_coeffs[k - m1] = np.sum(f_values * np.exp(-1j * k * x)) / n
    return f_coeffs

def fourier_series(coeffs, m1, x):
    """傅立叶级数"""
    sum = np.zeros_like(x, dtype=complex)
    for k, coeff in enumerate(coeffs, start=m1):
        sum += coeff * np.exp(1j * k * x)
    return sum

def solve_differential_equation(f, n, m1, m2):
    """求解微分方程"""
    f_coeffs = compute_fourier_coefficients(f, m1, m2, n)
    u_coeffs = np.array([f_k / (k**2 + 1) if k != 0 else f_k for k, f_k in enumerate(f_coeffs, start=m1)])
    return u_coeffs

def exact_solution(x):
    """精确解"""
    return np.sin(x) / (2 + np.cos(x))

def f_example(x):
    """算例的f(x)"""
    return (2 * np.sin(x) / (2 + np.cos(x)) 
            - 2 * np.sin(x)**3 / (2 + np.cos(x))**3 
            - 3 * np.sin(x) * np.cos(x) / (2 + np.cos(x))**2)

# 参数设置
m1, m2 = -10, 10

# 不同的n值
n_values = range(5, 22)
errors = []

for n in n_values:
    x = np.linspace(0, 2*np.pi, n, endpoint=False)
    u_coeffs = solve_differential_equation(f_example, n, m1, m2)
    u_approx = fourier_series(u_coeffs, m1, x)
    error = np.max(np.abs(u_approx - exact_solution(x)))
    errors.append(error)

# 绘制误差图
plt.plot(n_values, errors, marker='o')
plt.xlabel('n')
plt.ylabel('Maximum Error')
plt.title('Error vs. n in Differential Equation Solution')
plt.grid(True)
plt.show()
