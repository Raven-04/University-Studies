function A = Newton_Divided_Difference_Matrix(x,y)
n = length(x);
A = zeros(n,n+1);
% assign dependent variables to the first and second column of A.
A(:,1) = x; % 
A(:,2) = y; % 
%%% (j-2) is used to determine 1) number of points used in A(i,j): x_i and x_{i+(j+1)}  
%%% 2) the non empty div diff from 1 to n-(j-2), A(1,:) to A(n-(j-2),j)
for j = 3:n+1
for i = 1:n-(j-2)
A(i,j) = (A(i+1,j-1)-A(i,j-1))/(A(i+(j-2),1)-A(i,1));
end
end
end
