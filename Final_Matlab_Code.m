%Group five mech 103 final project 
%By Ethan Anspach Kayla Hackett Christina Chang Wail Alkindi


clc
clear
m = [0.53463 0.00197 0.05247]; %masses each ball in kilograms
h = 0.3048; %height of the ball when it was dropped in meters
g = 9.8; %acceleration due to gravity on earth in m/s
inToMet = 0.0254; %conversion factor between inchees and meters
heightData = xlsread('RampData.xlsx');

%loop that calculates the initial potential energy for each ball
%stores it in a matrix
for i = 1:3
    initPE(1,i) = m(i)*g*h;
end

i = 1;

while i <= 5
    for j = 1:3
        %if statements find the experimental runs conducted on each 
        %friction material and stores them in a temporary matrix.
        if j == 1
            tempMatrix = heightData(1:3,i);
        elseif j == 2
            tempMatrix = heightData(7:9,i);
        else
            tempMatrix = heightData(13:15,i);
        end
        meansMatrix(j,i) = mean(tempMatrix);
        resultantPE(j,i) = meansMatrix(j,i) * m(j) * g * inToMet; 
        energyLoss(j,i) =resultantPE(j,i)- initPE(j);
        
        %calculates the angle of the ramp based on the hight data of the
        %ball
        x(j,i) = sqrt((12^2)-((12-meansMatrix(j,i))^2));
        theta(j,i) = atan(meansMatrix(j,i)/x(j,i));
        %calculates the coeffiecent of kinetic friction and the normal
        %force
        fNormal(j,i) = m(j)* g * (cos(theta(j,i)));
        coefFriction(j,i) = abs(energyLoss(j,i)/fNormal(j,i));
    end
    i = i +1;
end

%The temporary matrix contains all the data for a single ball on
%a single ramp material.
%The data is then averaged and stored in a 5x3 matrix where
%each data point is the mean of three experimental runs
%The resultant potential energy of the ball is calculated using
%the average height of each trial on each material and
%multiplying the mass of the ball by the acceleration
%due to gravity.
%The height is converted from inches to meters.
%Each resultant potential energy is then stored
%in a new matrix.
%The energy loss is calculated by subtracting the resultant
%potential energy from the initial potential energy of each
%respective ball
%loss in energy of that experiment.
fprintf('The energy loss due to friction in joules in all the trial runs are:\n');
disp(energyLoss);
fprintf('The coefficients of kinetic friction between each ball and surface are: \n');
disp(coefFriction);



%this function takes a user input for the mass of a ball used on our ramp
%and the height the ball reached after it was dropped and calculates the
%energy lost to friction.

mass = input('What is the mass of the ball that is being used in kg?');
heightIn = input('What height did the ball reach on the other side of the ramp in inches?');
if heightIn < 12
height = heightIn * inToMet;
userPotential = mass*h*g;
userEndPotential = mass * height * g;
userEnergyLoss = userEndPotential - userPotential;
disp(userEnergyLoss);
fprintf('The energy lost due to friction in your experiment is: %2.3f joules',userEnergyLoss)
else
    warning('The height value you entered exceeds the maximum possible height value');
end
    