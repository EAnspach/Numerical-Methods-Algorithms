vo = 55;
c = 15;
m = 80;
ea = 100;
g = 9.8;
t = 3.827111;
iter = 0;
%functions for both f(x) and the derivative of f(x), declared as df

f = @(x) vo*exp(-1*(c/m)*t)-((m*g)/c)*(1-exp(-1*(c/m)*t));
df = @(x) -20.1125*exp((-3*x)/16);
%% plot
%plot f(x) to provide an inital guess for newton's method
disp(f(2))
%% calculation
%run Newton's method to find the root until the percent relative error is less than 0.0001%
for i = 1:4
    ea = abs((t-(f(t))/(df(t))-t)/(t-(f(t))/(df(t))))*100;
    t = t-((f(t))/(df(t)));
    iter = iter + 1;
    fprintf('The t value is: %f, the iteration is: %f\n',t,iter)
end