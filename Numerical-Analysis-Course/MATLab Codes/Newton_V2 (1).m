%% Newton's Method is used to find a root of a function  f(x), i.e. find x such that f(x) = 0.

%% Required INPUT parameters for the Newton's Method:
% f(x) : function f(x) :: we are looking for a root of f(x).
% df(x) : the first derivative of f(x) (i.e. f'(x) )
% x0 : initial guess for the root
% epsilon : stopping criterion applied to "approximate relative error" 
%           computed as | x_{n+1} - x_{n} | / |x_{n+1}|
% N_MAX : MAXimum number of iterations allowed for the algorithm

%% OUTPUTS
% Root : Approximation of the root
% TableRootApproxList : Table containing, at each iteration, the value of the approximation of
% the root. The TableRootApproxList has 2 columns. 
% First column contains the number of the iteration starting by iteration 0.
% Second column contains the the value of the Approximation of the root.

function [Root, TableRootApproxList] = NewtonMethod(f,df,x0,epsilon,N_MAX)

% Initialization of the Table that will contain 
% the iteration number AND the list of all
% approximations of the root.
%TableRootApproxList = Nan(N_MAX,2); % We initiate the values as "NaN : Not A Number"

% Initialization of the guess for the root of f(x)
x_old = x0;

% Eliminate the object TableRootApproxList. We will fill it here as we go.
clear TableRootApproxList;

% Iteration "zero" : starting point
% This is an easy way to fill one Row of the table at a time:
TableRootApproxList(1,:) = [0, x_old]; % Fill the Row 1

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ALTERNATIVE WAY to FILL the TABLE: one entry at a time
% TableRootApproxList(1,1) = 0; % Row 1, Column 1
% TableRootApproxList(1,2) = x_old; % Row 1, Column 2
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for i=1:1:N_MAX
    % Newton's method iteration
    x_new = x_old - f(x_old)/df(x_old); 

    % At each Iteration, we put values in a new row of the Table.
    % This is an easy way to fill one Row of the table at a time:
    TableRootApproxList(i+1,:) = [i, x_new]; % Fill the Row (i+1)

    % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ALTERNATIVE WAY to FILL the TABLE: one entry at a time
    % At each Iteration, we put values in a new row of the Table.
    % TableRootApproxList(i+1,1) = i; % Next Row, Column 1 : Number of the iteration
    % TableRootApproxList(i+1,2) = x_new; %  Column 2 : Value of the approximation
    % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    % Approximate Relative Error
    Approx_RelativeError = abs(x_new - x_old)/abs(x_new);
    
    % Test of convergence
    if ( Approx_RelativeError < epsilon ) % We have converged.
        break; % If we have converged, we stop.
    else % If no convergence yet, get ready for the next iteration.
        x_old = x_new;
    end
end

% OUTPUT parameter: the approximation of the Root of f(x)
Root = x_new;

% Display final result on the screen
disp('You used Newton Method');
XX_Message = sprintf('Root is = %d. Convergence in %d iterations', Root,i);
disp(XX_Message);
end