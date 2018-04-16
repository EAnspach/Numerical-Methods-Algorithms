function[root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxIter)
%{
This algorithm uses the false position method to determine the root of a
function in a certain bracketed area
Inputs:
• func - the function being evaluated
• xl - the lower guess
• xu - the upper guess
• es - the desired relative error (should default to 0.0001%)
• maxiter - the number of iterations desired (should default to 200)
Outputs:
• root - the estimated root location
• fx - the function evaluated at the root location
• ea - the approximate relative error (%)
• iter - how many iterations were performed

By Ethan Anspach
%}

%Initial values for output variables and loop logic variables
root = 0;
ea = 100;
iter = 0;
guess = 0;

%Logic that checks for the number of user inputs and provides default
%values if necessary
if nargin < 3
    error('This function requires at least three inputs')
elseif nargin == 3
    es = 0.0001;
    maxIter = 200;
elseif nargin == 4
    maxIter = 200;
end

%loop that runs the false position calculations until your calcuated
%approximate relative error is less than the desired error, or the
%iterations of the loop reach the desired max iterations.
while (ea > es) && (iter <= maxIter) && (guess ~=1)
    iter=iter+1;
    %approximate relative error calculations
    ea = ((xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu))))-root)/(xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu))));
    %calculations to find the approximate value of the loop using the false
    %position method
    root = (xl+xu)/2;
    disp(ea)
    %logic to bracket the root for the next estimate by checking the sign
    %of the estimate multiplied by the current brackets. If the sign is
    %negative, those two numbers become the new bracket
    if func(root) == 0
        guess = 1; %if the user input the root in their guess, the calculations end
    elseif (func(root)*func(xl)) < 0
        xu = root;
    elseif (func(root)*func(xu)) < 0
        xl = root;
    end
end
%find the value of the function evaluated at the root
fx = func(root);
%print output results
fprintf('The Value of your root is %f.\n', root)
fprintf('The function evaluated at your root is %f.\n', fx)
fprintf('The approximate relative error is %1.10f percent.\n', ea)
fprintf('The number of iterations is %1.0f.\n', iter)



