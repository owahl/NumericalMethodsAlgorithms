function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
%Function uses false position method to calculate the root of a given
%mathematical function
%NOTE: You MUST use the function handle "@(var)func" in order to input the
%desired mathematical function
%Input:
%func = the function being evaluated
%xl = the lower guess
%xu = the upper guess
%es = the desired relative error (if unspecified, default = 0.0001%)
%maxiter = the desired number of iterations (if unspecified, default = 200)
%Output:
%root = the estimated root location
%fx = the function evaluated at the root location
%ea = the appropriate relative error (%)
%iter = how many iterations were performed

%Displays outputs in the long format
format long
%Determines minimum number of arguments required--func, xl, and xu
if nargin < 3
    error('Include at least three input arguments.');
end
%Determines if xl and xu brackets a root
test = func(xl)*func(xu);
%If the answer is positive, the bounds do not bracket a root
if test > 0 
    error('Failed to bracket root, designate new values for xl and xu.');
end
%Defaults the stopping criterion if an input isn't specified or there are
%fewer than four input arguments
if nargin < 4 || isempty(es)
    es = 0.0001;
end
%Defaults the maximum iterations if there are fewer than five input
%arguments
if nargin < 5
    maxiter = 200;
end
%Defines the output variable: zero iterations, general assignment for xr,
%and and appropriate relative error of 100%
iter = 0; xr = xl; ea = 100;
%The citeria for the loop to run: ea exceeds the stopping criteria and iter
%does not go over maxiter
while ea > es && iter < maxiter 
    %Defines the old xr value
    xrold = xr; 
    %Uses the false position method
    xr = xu - (func(xu)*(xl - xu))/(func(xl) - func(xu));
    %Defines the current iteration
    iter = iter +1;
    %Solves for the percent approximation error
    ea = abs((xr-xrold)/xr)*100; 
    %Tests to find the new subinterval for the root
    test = func(xl)*func(xr);
    if test < 0
        %The test is successful and the new upper bound is defined as xr
        xu = xr;
    elseif test > 0
        %The test is unsuccessful and a new lower bound is defined as xr
        xl = xr;
    else
        %The test produced 0, meaning the exact root was found
        ea = 0;
    end
end
%The value of the root is xr
root = xr;
%The value of fx is func(xr), which is close to zero
fx = func(xr);
%The variables are displayed in a table, which will help clarify the
%results when the function is run in a script
Results = table(root, fx, ea, iter);
display(Results);
end