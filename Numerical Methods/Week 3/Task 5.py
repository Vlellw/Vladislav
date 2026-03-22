import numpy as np
import time

n = 10000   
x = np.linspace(0, 1, n)

# a)

print("=== Vandermonde Matrix ===")

# Double loop
start = time.time()

V_loop = np.zeros((n, n))
for i in range(n):
    for j in range(n):
        V_loop[i, j] = x[i] ** j

end = time.time()
print(f"Loop time: {end - start:.4f} seconds")

# Vectorized
start = time.time()

V_vec = x[:, None] ** np.arange(n)

end = time.time()
print(f"Vectorized time: {end - start:.4f} seconds")

# Check
diff_V = np.max(np.abs(V_loop - V_vec))
print(f"Max difference (V): {diff_V:e}")




# b)

print("\n=== Kernel Matrix K ===")

# Double loop
start = time.time()

K_loop = np.zeros((n, n))
for i in range(n):
    for j in range(n):
        K_loop[i, j] = np.exp(-abs(x[i] - x[j]))

end = time.time()
print(f"Loop time: {end - start:.4f} seconds")

# Vectorized
start = time.time()

D = np.abs(x[:, None] - x[None, :])
K_vec = np.exp(-D)

end = time.time()
print(f"Vectorized time: {end - start:.4f} seconds")

# Check
diff_K = np.max(np.abs(K_loop - K_vec))
print(f"Max difference (K): {diff_K:e}")
