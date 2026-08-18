% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % This script is calling 
%   FixedPointMethod.m  with the correct input parameters.
%   NewtonMethod.m      with the correct input parameters.
%   SecantMethod.m      with the correct input parameters.
%   BisectionMethod.m   with the correct input parameters.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% We want to find a root of a function  f(x), i.e. find x such that f(x) = 0.

clear all; % Deletes all variables... everything ... from the memory


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Newton's Method is used to find a root of a function  f(x).

% INPUT
% Required input parameters for the Newton's Method:
% f(x) : function f(x) :: we are lloking for a root of f(x)
% df(x) : the first derivative of f(x) (i.e. f'(x) )
% x0 : initial guess for the root
% epsilon : stopping criterion applied to "approximate relative error" 
%           computed as | x_{n+1} - x_{n} | / |x_{n+1}|
% N_MAX : MAXimum number of iterations allowed for the algorithm

% OUTPUTS
% Root_by_Newton : approximation of the root
% TableRootApproxList : Table containing, at each iteration, the value of the approximation of
%   the root. The TableRootApproxList has 2 columns. 
%   First column contains the number of the iteration starting by iteration 0.
%   Second column contains the the value of the Approximation of the root.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Define the function  f(x) and its first derivative f'(x)

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IMPORTANT NOTE: 
% For  x^3, it is wiser to write  x.^3 
% The dot will allow evaluation even when x is actually a vector containing 
% a lot of entries.
% If you only write  x^3  (without a dot), then you can only evaluate x as
% a scalar (number) ...  but not as a vector with several entries.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% f = @(x) x.^3 + 4*x.^2 - 10;
% df = @(x) 3*x.^2 + 8*x;

f = @(x) x.^3 - 6*x.^2 + 11*x - 6; % This function has 3 roots: 1,2,3.
df = @(x) 3*x.^2 - 12*x + 11;


% an initial value (initial guess for the root)
x0 = 4;
% accuracy for the approximate relative error
epsilon = 10^(-6);
% maximum number of iterations allowed for the algorithm
N_MAX = 1000;

% call for the NEWTON's Method
[Root_by_Newton,TableIterations] = Newton_V2(f,df,x0,epsilon,N_MAX);
Root_by_Newton % Display in the command window the Root
TableIterations % Display in the command window the Table with iterations and approximations

% On the same graph, we have f(x) AND Consecutive Root Approximations AND the value
% of f(x) at those Root Approximations
xx = [1:0.1:4.4];
figure(1)
plot(xx,f(xx),'g'); % graph of f(x) in green color
title('f(x), Root Approximations and f(RootApproximations)');
hold on; % holds in place the axes and the previous graph
plot(TableIterations(:,2),0,'kx'); % Root Approximations on "x-axis", in black color, with "x" as a marker on the graph
plot(TableIterations(:,2),f(TableIterations(:,2)),'ro'); % Value of f(x) at those Root Approximations, in red color, with "o" as a marker on the graph
hold off; % releases the axes

% List of colors: r,g,b,c,m,y,k,w
% To learn more about plot, type   help plot   in the command window below
% or go to HELP in MATLAB

 