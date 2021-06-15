function [ x, x1, err ] = newton(f, x0, tol, itr )
%NEWTON Find the root of the given function using Newton-Raphson method
%   Input:
%           f: The input function to calculate its root
%           x0: initial input
%           tol: Error tolerance 
%           itr: Iterations limit
%   This function takes the function, initial input, error tolerance and
%   iterations limit to compute the root using Newton-Raphson method.

syms x;
der=diff(f);
x = x0;
i = 2;
while i < itr
    f0=subs(f,'x',x0);
    f0_der=subs(der,'x',x0);
    x1=x0-(double(f0)/double(f0_der));
    if abs(x1-x0)<tol,break,end
    x0=x1;
    i = i + 1;
end 
err = abs(x1-x);
end

