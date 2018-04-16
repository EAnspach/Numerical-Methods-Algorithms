%Algorithm used to calculate machine epsilon
%By Ethan Anspach
err = 1;
loopEnd = 0;

while loopEnd == 0
    if (err+1) <=1
        err = 2*err;
        loopEnd = 1;
    else
        err = err/2;
    end 
end
