%% 6.3
clc; clear all;

f = @(t,y) sin(t.*y) + cos((t.^2 + y.^3).^4);

t0 = 0;
T = 5;
y0 = 1;

N_values = [20, 50, 100];

figure;

for j = 1:length(N_values)
    
    n = N_values(j);
    h = (T - t0)/n;
    
    t = t0;
    
    % intitial values
    y_euler = y0;
    y_rk = y0;
    
    % arrays for graphics
    t_vals = zeros(1,n+1);
    euler_vals = zeros(1,n+1);
    rk_vals = zeros(1,n+1);
    
    t_vals(1) = t;
    euler_vals(1) = y_euler;
    rk_vals(1) = y_rk;
    
    % main loop
    for i = 1:n
        
        % Euler's method
        y_euler = y_euler + h * f(t, y_euler);
        
        % RK4
        k1 = f(t, y_rk);
        k2 = f(t + h/2, y_rk + h*k1/2);
        k3 = f(t + h/2, y_rk + h*k2/2);
        k4 = f(t + h, y_rk + h*k3);
        
        y_rk = y_rk + h/6*(k1 + 2*k2 + 2*k3 + k4);
        
        % update t
        t = t + h;
        
        % save
        t_vals(i+1) = t;
        euler_vals(i+1) = y_euler;
        rk_vals(i+1) = y_rk;
    end
    
    % graphic
    subplot(3,1,j);
    plot(t_vals, euler_vals, 'o-'); hold on;
    plot(t_vals, rk_vals, 's-');
    
    title(['n = ', num2str(n)]);
    xlabel('t');
    ylabel('y');
    legend('Euler','RK4');
    grid on;
end
