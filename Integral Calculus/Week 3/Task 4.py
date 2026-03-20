import numpy as np

# function
def f(x):
    return np.cos(x)

I_exact = np.sin(1)

def trapezoid_rule(f, a, b, n):
    x = np.linspace(a, b, n+1)       # n+1 point
    y = f(x)
    h = x[1] - x[0]
    s_n = h * (0.5*y[0] + np.sum(y[1:-1]) + 0.5*y[-1])
    return s_n

n_values = [20, 40, 60, 80, 100]

# calc of the mistake
for n in n_values:
    s_n = trapezoid_rule(f, 0, 1, n)
    error = abs(I_exact - s_n)
    print(f"n={n:3d}, S_n={s_n:.8f}, Error={error:.8e}")
