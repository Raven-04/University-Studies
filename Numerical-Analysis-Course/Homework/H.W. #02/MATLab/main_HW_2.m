% Defined data set.
x = [0.9, 1.3, 1.9, 2.1, 2.6, 3.0, 3.9, 4.4, 4.7, 5.0, 6.0, 7.0, 8.0, 9.2, 10.5, 11.3, 11.6, 12.0, 12.6, 13.0, 13.3];
f = [1.3, 1.5, 1.85, 2.1, 2.6, 2.7, 2.4, 2.15, 2.05, 2.1, 2.25, 2.3, 2.25, 1.95, 1.4, 0.9, 0.7, 0.6, 0.5, 0.4, 0.25];

% Range of x values for the plotting of the curves.
xq = linspace(min(x), max(x), 100);

% Call the Lagrange Interpolation function.
yqLagrange = arrayfun(@(xp) Lagrange_Interpolation_Polynomial(x, f, xp), xq);

% Call the Natural Cubic Spline Interpolation function.
coefficients = Natural_Boundary_Cubic_Splines(x, f);

yqSpline = zeros(size(xq));

% Evaluating the spline at each point.
for j = 1:length(xq)
    for i = 1:length(x)-1
        if xq(j) >= x(i) && xq(j) <= x(i+1)
            h = xq(j) - x(i);
            yqSpline(j) = coefficients(i, 1) + coefficients(i, 2) * h + coefficients(i, 3) * h^2 + coefficients(i, 4) * h^3;
            
            break;
        end
    end
end

% Plotting the results on a figure.
figure;
hold on;

% Original data points.
plot(x, f, "ro", "MarkerSize", 4.5, "DisplayName", "Data Points");

% Lagrange Interpolation.
plot(xq, yqLagrange, "b-", "LineWidth", 1.5, "DisplayName", "Lagrange Interpolation");

% Natural Cubic Interpolation.
plot(xq, yqSpline, "g--", "LineWidth", 1.5, "DisplayName", "Natural Cubic Spline");

xlabel("x");
ylabel("f(x)");
title("Lagrange Interpolation & Natural Cubic Spline");
legend("Location", "Best");
grid on;
hold off;