f = @(x) x.^5 + x.^3 + x - 1;
df = @(x) 5*x.^4 + 3*x.^2 + 1;
x = 0; % initial guess
for k = 1:10
    x = x - f(x)/df(x);
end
disp(x)
