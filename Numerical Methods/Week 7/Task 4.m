clear; clc; close all;

syms x;

% According to the condition
f = x;
for i = 1:50
    f = cos(f); % Inner cosine
    f = sin(f); % Outer sine
end

% Automatic differentiation
df = diff(f, x);

% Plot on the interval [0, 1]
fplot(df, [0, 1], 'LineWidth', 2);

grid on;
title('Derivative of the composition of 50 sines and 50 cosines');
xlabel('x');
ylabel('f''(x)');
legend('df/dx');
