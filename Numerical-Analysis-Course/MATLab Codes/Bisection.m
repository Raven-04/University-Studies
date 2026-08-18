function xr = Bisection(f, a, b, e)

E = e + 1;
while (E > e )
    xnew = (b+a)/2;
    E = abs((xnew-a)/xnew)*100;  
    if (f(xnew)==0) break; end

    if (f(xnew)*f(a)>0)    
         a = xnew;       
    else
        b = xnew;
    end

end
xr=xnew;
end

%%%% Improve this matlab function considering the following:
%%%% 1) by stoping the loop if the iteratiosn exeeced a certain number.
%%%% 2) by making the output as a table  containing the root, a,b f(root),
%%%% f(a), f(b), and all type of errors  for  each iteration.