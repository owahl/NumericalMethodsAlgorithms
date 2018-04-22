# Simpson Algorithm
[I] = Simpson(x, y)

The Simpson algorithm integrates experimental data using Simpson's 1/3 rule. If there is an odd number of segments, the function uses the trapezoidal rule to calculate the area of the final segment.

**Inputs:**
* x-equally spaced input values
* y-output values

**Output:**
* I-the integral of the data

**Limitations:**
* Each input must be in the form of a one-row matrix
* Unequally spaced x-values will result in an error
* The inputs must be the same size
