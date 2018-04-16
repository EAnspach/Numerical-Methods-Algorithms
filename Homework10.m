clc
clear
%{
This algorithm calculates the mole fraction (x) of H2O required to satisfy the 
equation describing the dissociation of water when the reaction’s equilibrium
constant (K) is 0.05 and the pressure (pt) is 3 atm. This algorithm uses
Newton's method to find this x value. 
By Ethan Anspach
%}
%% initalize
%declare all variables used in calculations
pt = 3;
K = 0.05;
root = 0;
ea = 100;
iter = 0;
%functions for both f(x) and the derivative of f(x), declared as df
f = @(x) ((x/(1-x))*sqrt((2*pt)/(2+x))-0.05);
df =@(d) ((sqrt(3)*(d^2+d+4))/(sqrt(2)*(-d+1)^2*(d+2)^(3/2)));
%% plot
%plot f(x) to provide an inital guess for newton's method
fplot(f);
xlim([-5 5])
ylim([-10 10])
refline(0,0)

%% calculation
%run Newton's method to find the root until the percent relative error is less than 0.0001%
while ea > 0.0001
    ea = abs((root-(f(root))/(df(root))-root)/(root-(f(root))/(df(root))))*100;
    root = root-(f(root))/(df(root));
    iter = iter + 1;
end
%% end
%print out the root, error and number of iterations
fprintf('The x value that satisfies the equation for the dissociation of H2O when K = 0.05 and pt = 3 is %f.\n',root)
fprintf('This root was found in %1.0f iterations of newtons method and has a relative error of %1.12f percent.\n',iter, ea)


