f = inline('x.^3 + 4.*x.^2 - 10', 'x');
df = inline('3*x.^2+8*x', 'x');

a = 1;
e = 0.001;   %Error tolerance


xr=Newton(f,df, a, e);
x=a:0.0001:b;
plot (x,f(x),'b',xr,f(xr),'ro')

%%%% Improve this matlab  scipt  by  improving the plot so you can see the
%%%% function and  the values of root at each iteration step.

