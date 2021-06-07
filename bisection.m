function [ output_args ] = bisection( f, xl, xu, tol, itr ) 
%BISECTION Find the root of the given function using bisection method
%   Input:
%           f: The input function to calculate its root
%           xl: Lower interval bound
%           xu: Higher interval bound
%           tol: Error tolerance 
%           itr: Iterations limit
%   This function takes the function, interval, error tolerance and
%   iterations limit to compute the root using bisection method.

for i=2:itr
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

if abs((xnew(i)-xnew(i-1))/xnew(i))<tol,break,end
end
output_args = num2str(xr);
end

