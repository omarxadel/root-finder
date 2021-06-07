function [ output_args ] = false_pos( f, xl, xu, tol, itr )
%FALSE_POS Find the root of the given function using false position method
%   Input:
%           f: The input function to calculate its root
%           xl: Lower interval bound
%           xu: Higher interval bound
%           tol: Error tolerance 
%           itr: Iterations limit
%   This function takes the function, interval, error tolerance and
%   iterations limit to compute the root using false position method.

for i=2:itr
    xr=((xl*f(xu))-(xu*f(xl)))/(f(xu)-f(xl));
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

