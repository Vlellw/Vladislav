clc; clear; close all;

g = @(x) -exp(x);   
x0 = 0;             
tol = 1e-6;         %proximity
max_iter = 100;     %max of iterations

x = x0;
for k = 1:max_iter
    x_new = g(x);
    if abs(x_new - x) < tol
        fprintf('Solved: x = %.6f\n', x_new);
        fprintf('Num of iterations: %d\n', k);
        break;
    end
    
    x = x_new;
end

if k == max_iter
    fprintf('Limit of iterations reached.\n');
end
