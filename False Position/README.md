This algorithm uses the false position method to determine the root of a function in a certain bracketed area.
Inputs:

• func - the function being evaluated 
• xl - the lower guess 
• xu - the upper guess 
• es - the desired relative error (defaults to 0.0001%) 
• maxiter - the number of iterations desired (defaults to 200) 
Outputs:
• root - the estimated root location 
• fx - the function evaluated at the root location 
• ea - the approximate relative error (%)  
• iter - how many iterations were performed 
