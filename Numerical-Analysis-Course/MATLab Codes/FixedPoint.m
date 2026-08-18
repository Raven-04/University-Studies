function xr = FixedPoint(g, xold, e)

E = e + 1;
while (E > e)
  
    xnew = g(xold);
    E = abs((xnew-xold)/xnew)*100;
    xold = xnew;
    
end

xr=xnew;

end


%%%% Improve this matlab function considering the following:
%%%% 1) by stoping the loop if the iteratiosn exeeced a certain number.
%%%% 2) by making the output as a table  containing the xr, g(xr),  and
%%%% all type of errors for  each iteration.