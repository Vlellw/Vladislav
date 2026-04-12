%% 6.4 (b)

clc; clear all;

% system
fx = @(x,y) 0.2*x - 0.01*x*y;
fy = @(x,y) -0.2*y + 0.001*x*y;

t0 = 0;
T = 100;
h = 1;
n = (T - t0)/h;

% initial condition
x = 100;
y = 10;
t = t0;

% arrays
t_vals = zeros(1,n+1);
x_vals = zeros(1,n+1);
y_vals = zeros(1,n+1);

t_vals(1) = t;
x_vals(1) = x;
y_vals(1) = y;

% Euler's method
for i = 1:n
    
    x_new = x + h * fx(x,y);
    y_new = y + h * fy(x,y);
    
    x = x_new;
    y = y_new;
    t = t + h;
    
    t_vals(i+1) = t;
    x_vals(i+1) = x;
    y_vals(i+1) = y;
end

% graphic
figure;
plot(t_vals, x_vals, 'b-', 'LineWidth', 1.5); hold on;
plot(t_vals, y_vals, 'r-', 'LineWidth', 1.5);
xlabel('t');
ylabel('Population');
legend('x(t)', 'y(t)');
title('Wolf-Hare Model (Euler method)');
grid on;
