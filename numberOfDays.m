function [nd] = numberOfDays(mo, da, leap)
%This function takes the number of the month, the day, and if it is a leap
%year and returns the number of days that have passed in the year
%inputs: mo, integer value that is the number of the month
%        da, the day it is in the month
%        leap, a boolean input with 0 bein not a leap year and 1 being a
%        leap year
%outputs: nd, the number of days that have passed based in the inputs

months = [31 28 31 30 31 30 31 31 30 31 30 31];
nd = 0;
if nargin ~= 3
    error('Input 3 arguments to this function')
elseif (da < 1) || (da > 31)
    error('Invalid input, please enter a number greater than one and less than 31 for days')
elseif (mo < 1 || mo > 12)
    error('Invalid input, please enter a number between one and 12 for months')
else
    for i = 1:(mo-1)
        nd = nd + months(i);
    end
        if leap == 1 && da ~= 29 && mo < 3
            nd = nd + da + 1;
        else
            nd = nd + da;
        end
end

