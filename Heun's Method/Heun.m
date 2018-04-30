function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%% Help
%{
This function uses heun's method to solve an ordinary differential
equations across an input interval.
By Ethan Anspach 4/28/18

Inputs:
• dydt - the differential equation that is being solved, must be entered in
the form of an anonymous function. EX: @(t,y) -y+t^2
• tspan- The interval over which you are solving the differential equation,
must be entered as a 1 by 2 vector. EX: from 0 to 4 would be entered as[0 4]
• y0- The inital condition, or the y value of y(t) at your initial t value
• h- The step size used in calculations, a lower step size results in a
better approximation, must be smaller than the size of the interval
• es - the desired relative error (defaults to 0.001)
• maxiter - the number of iterations desired (defaults to 50)

Outputs:
• t- vector containing all the values of t that the differential equation
is solved at, based on tspan and h
• y- solutions to the differential equation at each t value
%}
%% Initialize Variables
slopeLeft = 0;
slopeRight = 0;
yi = 0;
yNew = 0;
ea=100;
iter=0;
finalStep = mod(tspan(2),h);
size = (tspan(2)+abs(tspan(1)));
yi=y0;
y1=0;
%% Catch Errors
if finalStep ~= 0
    t=[tspan(1):h:floor(tspan(2))];
    t=[t,tspan(2)];
else
    t=[tspan(1):h:floor(tspan(2))];
end
y = zeros(1,length(t));

if nargin < 4
    error('This function requires at least four input arguments')
elseif nargin == 4
    es = 0.001;
    maxit = 50;
else
    maxit = 50;
end
disp(h)
if h > size
    error('h must be smaller than the size of your interval')
end

if h <= 0
    error('h must be a positive non-zero number')
end
%% Calcualtions
for i =1:floor(size/h)
    %This section calculates the predictor value for each t value and
    %resets the error and iteration loop variables
    slopeLeft = dydt(t(i),y0);
    y1 = y0+h*(dydt(t(i),y0));
    ea=100;
    iter = 0;
    while ea >= es
        %This while loop calculates the right hand slope and then
        %approximates the next y value using the corrector equation. It
        %then calculates the right hand slope at the new y value and
        %repeats until the relative error is less than or equal to es
        slopeRight = dydt(t(i)+1,y1);
        yNew = y1+(h/2)*(slopeLeft+slopeRight);
        ea = abs((yNew-yi)/yNew);
        yi=yNew;
        iter=iter+1;
        if iter >= maxit
            break
        end
    end
    y0=yi;
    y(i)=y0;
end
plot(t,y)
