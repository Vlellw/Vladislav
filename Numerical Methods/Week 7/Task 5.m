clear; clc;

eta = 0.05;      % Learning rate
tol = 1e-4;      % Stopping tolerance t
n_max = 1000;    % Maximum number of iterations
x0_list = [1, 2, 3, 4, 5];

% Define functions and their derivatives
% f1(x) = x^2 - 8cos^2(x)
f1 = @(x) x^2 - 8*cos(x)^2;
df1 = @(x) 2*x + 8*sin(2*x);

% f2(x) = x^2 + 2sin^2(x)
f2 = @(x) x^2 + 2*sin(x)^2;
df2 = @(x) 2*x + 2*sin(2*x);

functions = {f1, f2};
derivatives = {df1, df2};
labels = {'f1(x) = x^2 - 8cos^2(x)', 'f2(x) = x^2 + 2sin^2(x)'};

% Main execution loop
for f_idx = 1:2
    fprintf('\n--- Analyzing function: %s ---\n', labels{f_idx});
    f = functions{f_idx};
    df = derivatives{f_idx};
    
    % Table header for results
    fprintf('x0\t| Min Point\t| Type\t\t| Derivative Evals\n');
    fprintf('-----------------------------------------------------------\n');
    
    for x0 = x0_list
        x_curr = x0;
        deriv_evals = 0;
        
        for k = 1:n_max
            % Evaluate gradient
            g = df(x_curr);
            deriv_evals = deriv_evals + 1;
            
            % Check convergence criterion
            if abs(g) < tol
                break;
            end
            
            x_curr = x_curr - eta * g;
        end
        
        % For f1: Global minimum is at x = 0 (approx -8)
        % For f2: Global minimum is at x = 0 (approx 0)
        min_type = 'Global';
        if f_idx == 1 && abs(x_curr) > 0.5
            min_type = 'Local';
        end
        
        fprintf('%d\t| %.5f\t| %s\t| %d\n', x0, x_curr, min_type, deriv_evals);
    end
    
    % Plotting
    subplot(2,1,f_idx);
    fplot(f, [-5, 5], 'LineWidth', 1.5);
    grid on; 
    title(labels{f_idx}); 
    xlabel('x'); 
    ylabel('f(x)');
end
