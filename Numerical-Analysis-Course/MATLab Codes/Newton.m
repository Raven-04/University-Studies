function xr = Newton(f, df, xn, e)

E = e + 1;
while (E > e)

    xnew = xn - f(xn)/df(xn);
    E = abs((xnew - xn)/xnew)*100;   
    xn = xnew;
end

xr=xnew;
end


%%%% Improve this matlab function considering the following:
%%%% 1) by stoping the loop if the iteratiosn exeeced a certain number.
%%%% 2) by making the output as a table  containing the root,  f(root),
%%%% f(a), f(b), and all type of errors  for  each iteration.