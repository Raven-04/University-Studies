f = @(x) cos(x) - 2*sin(3*x);

p0 = 0;
p1 = 0.25;
p2 = 0.5;

tol = 10^-6;
maxIter = 100;

% Calling the muller method from the other M-file with the function
table = muller_method(f, p0, p1, p2, tol, maxIter);

% Plotting the function
x = linspace(-1, 1, 100);
plot(x, f(x), "b-", "LineWidth", 1.5);
hold on;

% Plotting the root
plot(table(end, 2), f(table(end, 2)), "ro", "MarkerSize", 10);
hold off;

title("Function and Root Visualization");
xlabel("x");
ylabel("f(x)");
grid on;
legend("f(x)", "Root")
xlim([-1 1]);
ylim([-2 2]);
hold off;

% Displaying the table and it's values
fprintf("# of iteration\t| Value of the Root (pn) \t| Approximate Relative Error\n");
fprintf("%.0f\t\t%.5f\t\t\t\t%.5e\n", table');