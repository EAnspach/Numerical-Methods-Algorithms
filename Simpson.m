function[I] = Simpson(x,y)
%% Help
%{
This function takes an input of two vectors that are equal in length and
evenly spaced and returns an output that is the numerical integral of function 
values "y" with respect to "x" over the
interval described by the two vectors. 

Created by Ethan Anspach 4/7/18
%}
%% Catch errors
I=0;
trap=0;
k = 1;
if length(x) ~= length(y)
    error('The two vectors must be the same length in order to implement Simpsons 1/3 rule')
end
if diff(diff(x)) ~= 0
    error('The input vectors must be evenly spaced')
end

if length(x) == 1
    error('The input vectors must have lengths of at least two')
end

if mod(length(x),2) == 0
    trap = 1;
    warning('The trapazoidal rule will need to be used to calculate this integral')
end

%% Calculations
if trap == 0
    for i = 1:floor((length(x)/2))
        %If the the vectors have odd lengths, only the 1/3 rule is used
        I=I+(x(k+2)-x(k))*(y(k)+4*y(k+1)+y(k+2))/6;
        k= k+2;
    end
elseif trap == 1
    for j = 1:floor((length(x)-1)/2)
        %If the vectors have even lengths, the 1/3 rule and the trapezoidal
        %rule are both used
        I=I+(x(k+2)-x(k))*(y(k)+4*y(k+1)+y(k+2))/6; %1/3 rule
        k= k+2;
    end
    I = I+(x(length(x)) - x(length(x)-1)) * (y(length(y)-1) + y(length(y)))/2; %trapezoidal rule
end