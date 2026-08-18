function yp = Lagrange_Interpolation_Polynomial(x, y, xp)

    % Initializing yp to 0 and N as the number of points.
    yp = 0;
    n = length(x);
    
    % Calculation of the polynomial at xp, as well as initializing Li(xp) for the ith term.
    for i = 1:n
        Li = 1;
        for j = 1:n
            if j ~= i
                Li = Li * (xp - x(j)) / (x(i) - x(j));
            end
        end
        
        % Adding the ith term to the result.
        yp = yp + y(i) * Li;
    end
end