function [output_args] = secant(f,x1, x2, tol, itr)
%SECANT Summary of this function goes here
%   Input:%         
%           f: The input function to calculate its root
%           xl: First guess
%           x2: second guess
%           tol: Error tolerance 
%           itr: Iterations limit

    x3 = x2 - ((f(x2)*(x1-x2))/(f(x1)-f(x2)));
    
for i=2:itr
    xnew(1)=0;
    x1 = x2;
    x2 = x3;
    x3 = x2 - ((f(x2)*(x1-x2))/(f(x1)-f(x2)));
    
if abs((x3-x2)/x3)<tol,break,end
end
output_args = num2str(x3);
end

