% Algorithm that calculates the minimum number that can be used in matlab
%By Ethan Anspach1

clc
clear
minNumber = 0.0000001;
i = 0;
 while minNumber ~= 0
     i = i+1;
     minNumber = minNumber^i;
     disp(minNumber)
 end
 