function coefficients = Natural_Boundary_Cubic_Splines(x, y)
    
    n = length(x);

    % Step a: aj = f(xj)
    a = y;
    
    % Step c: hj = xj+1 - xj
    h = diff(x);
    
    % Step d: Constructing a matrix A.
    A = zeros(n);
    A(1, 1) = 1;

    for j = 2:n-1
        A(j, j-1) = h(j-1);
        A(j, j) = 2 * (h(j-1) + h(j));
        A(j, j+1) = h(j);
    end

    A(n, n) = 1;

    % Step e: Constructing a vector z.
    z = zeros(n, 1);

    for j = 2:n-1
        z(j) = (3/(h(j-1))) * (a(j) - a(j-1)) - (3/(h(j))) * (a(j+1) - a(j));
    end

    % Step f: Solving the system A * c = z for c.
    c = A \ z;

    % Step g: Calculating both bj and dj
    b = zeros(n-1, 1);
    d = zeros(n-1, 1);

    for j = 1:n-1
        b(j) = (1/h(j)) * (a(j+1) - a(j)) - (h(j)/3) * (2*c(j) + c(j+1));
        d(j) = (1/3*h(j)) * (c(j+1) - c(j));
    end

    % Step h: Creating the output matrix of the coefficients.
    coefficients = zeros(n-1, 4);

    for j = 1:n-1
        coefficients(j, :) = [a(j), b(j), c(j), d(j)];
    end
end