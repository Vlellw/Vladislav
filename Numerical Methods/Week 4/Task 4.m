clc; clear; close all;

f1 = @(x) exp(-x.^2);
f2 = @(x) exp(-abs(x));

% Exact values of integrals
I1_exact = sqrt(pi) * erf(1);
I2_exact = 2 - 2/exp(1);

% Range of n
N = 1:1000;

% Error arrays
err_mid_1 = zeros(size(N));
err_trap_1 = zeros(size(N));
err_mid_2 = zeros(size(N));
err_trap_2 = zeros(size(N));

for k = 1:length(N)
    n = N(k);
    
    % Step size
    a = -1; b = 1;
    h = (b - a)/n;
    
    %% Midpoint rule
    x_mid = a + h/2 : h : b - h/2;
    I_mid_1 = h * sum(f1(x_mid));
    I_mid_2 = h * sum(f2(x_mid));
    
    %% Trapezoidal rule
    x = linspace(a, b, n+1);
    I_trap_1 = h * ( sum(f1(x)) - (f1(a) + f1(b))/2 );
    I_trap_2 = h * ( sum(f2(x)) - (f2(a) + f2(b))/2 );
    
    %% Errors
    err_mid_1(k) = abs(I_mid_1 - I1_exact);
    err_trap_1(k) = abs(I_trap_1 - I1_exact);
    
    err_mid_2(k) = abs(I_mid_2 - I2_exact);
    err_trap_2(k) = abs(I_trap_2 - I2_exact);
end

%% Plots
figure;

% First integral
subplot(1,2,1)
loglog(N, err_mid_1, 'b', 'LineWidth', 1.5); 
hold on;
loglog(N, err_trap_1, 'r', 'LineWidth', 1.5);
grid on;
title('exp(-x^2)');
legend('Midpoint', 'Trapezoidal');
xlabel('n'); ylabel('Error');

% Second integral
subplot(1,2,2)
loglog(N, err_mid_2, 'b', 'LineWidth', 1.5); hold on;
loglog(N, err_trap_2, 'r', 'LineWidth', 1.5);
grid on;
title('exp(-|x|)');
legend('Midpoint', 'Trapezoidal');
xlabel('n'); ylabel('Error');
