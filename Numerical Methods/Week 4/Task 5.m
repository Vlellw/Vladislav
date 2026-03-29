clc; clear;

phi = @(t) (1/sqrt(2*pi)) * exp(-0.5 * t.^2);

% Simpson's rule 
function I = simpson(f, a, b, n)
    % n must be even
    if mod(n,2) ~= 0
        error('n must be even');
    end
    
    h = (b - a) / n;
    x = a:h:b;
    
    fx = f(x);
    
    I = fx(1) + fx(end);
    
    % Odd indices
    for i = 2:2:n
        I = I + 4 * fx(i);
    end
    
    % Even indices
    for i = 3:2:n-1
        I = I + 2 * fx(i);
    end
    
    I = I * h / 3;
end

% Approximation
function val = normal_cdf(x, phi)
    a = -8;        % -infinity
    n = 1000;      % number of subintervals
    
    val = simpson(phi, a, x, n);
end

x_vals = 0:0.2:3.4;
Phi_vals = zeros(size(x_vals));

for i = 1:length(x_vals)
    Phi_vals(i) = normal_cdf(x_vals(i), phi);
end

fprintf('   x        Phi(x)\n');
for i = 1:length(x_vals)
    fprintf('%5.1f    %.6f\n', x_vals(i), Phi_vals(i));
end
