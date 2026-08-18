function table = muller_method(f, p0, p1, p2, tol, maxIter)
    table = [];
    i = 0;

    while i < maxIter
        i = i + 1;
        
        % Equations taken and implemented from the Numerical Analysis
        % notebook (p3, c, b, a)
        c = f(p2);

        b = ((p0-p2)^2 * (f(p1) - f(p2)) - (p1-p2)^2 * (f(p0) - f(p2))) / ((p0-p2)*(p1-p2)*(p0-p1));

        a = ((p1-p2) * (f(p0) - f(p2)) - (p0-p2) * (f(p1) - f(p2))) / ((p0-p2)*(p1-p2)*(p0-p1));

        discriminant = b^2 - 4 * a * c;
        if discriminant < 0
            error("Error: Complex root encountered.");
        end

        sqrtDisc = sqrt(discriminant);
        p3 = p2 - (2 * c) / (b + sign(b) * sqrtDisc);

        relativeError = abs((p3 - p2) / p3);

        table = [table; i, p3, relativeError];

        if relativeError <= tol
            break;
        end
        
        % This part updates the values for the next iteration
        p0 = p1;
        p1 = p2;
        p2 = p3;
    end
end