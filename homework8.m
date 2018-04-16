clc
clear
%this code calculates the zero through third order expansions of the Taylor
%series for the function f(x) = 25x^3-6x^2+7x-88 using x=1 as the starting
%point. 
%in addition it calculates the %relative error for each prediction 
%By Ethan Anspach

%True value of f(3) = 25(3)^3-6(3)^2+7(3)-88 = 554
trueValue = 554;
x=1;
approx=0;
err = 0;
h= 0.25;

%Zero order Taylor expansion of 25x^3-6x^2+7x-88
approx = 25*(x)^3-6*(x)^2+7*(x)-88;
err = (trueValue- (approx))/554 * 100;
sprintf('The zeroth approximation is: %f ', approx) 
sprintf('The error is is: %f percent', err)

%First order Taylor expansion
approx = approx + (75*(x)^2-12*(x)+7)*(3-1);
err = (trueValue- (approx))/554 * 100;
sprintf('The first approximation is: %f ', approx) 
sprintf('The error is is: %f percent', err)

%Second order Taylor expansion
approx = approx + ((150*(x)-12))/(2)*(3-1)^2;
err = (trueValue- (approx))/554 * 100;
sprintf('The second approximation is: %f ', approx) 
sprintf('The error is is: %f percent', err)

%Third order Taylor expansion
approx = approx + (150)/(3*2)*(3-1)^3;
err = (trueValue- (approx))/554 * 100;
sprintf('The third approximation is: %f ', approx) 
sprintf('The error is is: %f percent', err)


