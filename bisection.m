function [ xl, xu, xr, fx, err ] = bisection( f, xl, xu, tol, itr ) 
%BISECTION Find the root of the given function using bisection method
%   Input:
%           f: The input function to calculate its root
%           xl: Lower interval bound
%           xu: Higher interval bound
%           tol: Error tolerance 
%           itr: Iterations limit
%   This function takes the function, interval, error tolerance and
%   iterations limit to compute the root using bisection method.
i = 2;
while i<itr
    xr=(xu+xl)/2;
    if f(xu)*f(xr)<0
        xl=xr;
    else
        xu=xr;
    end
 
    if f(xl)*f(xr)<0
        xu=xr;
    else
        xl=xr;
    end
xnew(1)=0;
xnew(i)=xr;
if i > 2
if abs((xnew(i)-xnew(i-1))/xnew(i))<tol,break,end
end
i = i + 1;
end
fx = f(xr);
err = abs((xnew(i-1)-xnew(i-2))/xnew(i-1));
end

