%% 6.2
clc; clear all;

f = @(t,y) t + y;
exact = 2*exp(1) - 2;
target_error = 0.10; % 10%
n = 1;

while true
    h = 1/n;
    t = 0;
    y = 1;
    
    % Euler's method
    for i = 1:n
        y = y + h * f(t, y);
        t = t + h;
    end
    
    % relative error
    rel_error = abs(y - exact) / exact;
    
    if rel_error < target_error
        break;
    end
    
    n = n + 1;
end
fprintf('Min n = %d\n', n);
