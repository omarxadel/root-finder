function [ x1_1, x2_1, fx1, fx2, x3, err ] = secant( f,x1, x2, tol, itr )
%SECANT Summary of this function goes here
%   Input:%         
%           f: The input function to calculate its root
%           xl: First guess
%           x2: second guess
%           tol: Error tolerance 
%           itr: Iterations limit

i = 2;
x1_1 = x1;
fx1 = f(x1);
x2_1 = x2;
fx2 = f(x2);
while i < itr
    x3 = x2 - ((f(x2)*(x1-x2))/(f(x1)-f(x2)));
    if abs((x3-x2)/x3)<tol,break,end
    x1 = x2;
    x2 = x3;
    i = i + 1;
end
err = abs((x3-x2)/x3);
end

