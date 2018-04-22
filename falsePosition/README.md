# falsePosition Algorithm
The falsePosition function uses the false position method to calculate the root of a given mathematical function. The false position method is a closed method that uses bracketing to close in on the root of a given function.

**NOTE:** You *MUST* use the function handle "@(var)func" in order to input the desired mathematical function. Create the mathematical function using this method before using the falsePosition function.

**Input:**
* func = the function being evaluated
* xl = the lower guess
* xu = the upper guess
* es = the desired relative error (if unspecified, default = 0.0001%)
* maxiter = the desired number of iterations (if unspecified, default = 200)

**Output:**
* root = the estimated root location
* fx = the function evaluated at the root location
* ea = the appropriate relative error (%)
* iter = how many iterations were performed

**Limitations:**
* The xl and xu bounds must bracket the root
