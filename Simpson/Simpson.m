function [I] = Simpson(x,y)
%[I] = Simpson(x,y)
%Integrates experimental data using Simpson's 1/3 rule. If there is an odd
%number of segments, the function uses the trapezoidal rule to calculate
%the area of the final segment.
%Inputs:
%x-equally spaced input values
%y-output values
%Output:
%I-the integral of the data

%The function checks that both x and y are the same size
if length(x)~=length(y)
    error('X and Y vectors must contain the same number of values');
end
%Creates a vector based on the spacing of the x vector
dx = diff(x);
%Determines if the x vector is equally spaced
if sum(dx)~=dx(1)*length(dx)
    error('X vector must be equally spaced');
end
%Defines a variable based on the size of x that will help facilitate the
%Simpson's rule
n = length(x);
%Defines a variable based on the number of segments in the x vector
segment = n-1;
%The following if statement runs if there is an even number of segments. If
%there is an odd number of points, the remainder when divided by 2 is 1
if mod(n,2) == 1
    %Sums up the odd terms. The first term is y0, or y(1), so the second
    %term is y1, or y(2), and therefore odd
    odd = sum(4*y(2:2:n-1));
    %Sums up the even terms. The second term is y1, or y(2), so the third
    %term is y2, or y(3), and therefore even
    even = sum(2*y(3:2:n-2));
    %Performs the 1/3 Simpson's Rule
    integral = (x(n)-x(1))*(y(1)+odd+even+y(n))/(3*segment);
end
%The following if statement runs if there is an odd number of segments. If
%there is an even number of points, the remainder when divided by 2 is 0
if mod(n,2) == 0
    %The function warns the user that if there is an odd number of
    %segments, the trapezoidal rule must be applied for the last segment
    warning('The trapezoid rule will be used for the final interval');
    %Sums up the odd terms. The first term is y0, or y(1), so the second
    %term is y1, or y(2), and therefore odd
    odd = sum(4*y(2:2:n-2));
    %Sums up the even terms. The second term is y1, or y(2), so the third
    %term is y2, or y(3), and therefore even
    even = sum(2*y(3:2:n-3));
    %Performs the 1/3 Simpson's Rule for all intervals besides the last
    simp = (x(n-1)-x(1))*(y(1)+odd+even+y(n-1))/(3*(segment-1));
    %Performs the trapezoidal rule for the last interval
    trap = (x(n)-x(n-1))*(y(n-1)+y(n))/(2);
    %Combines the Simpson estimate with the trapezoidal estimate to find
    %the integral
    integral = simp + trap;
end
%Outputs the integral calculated with the 1/3 Simpson's rule
I = integral;
end