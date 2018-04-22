# luFactor Algorithm
[L, U, P] = luFactor(A)

The luFactor function determines the LU Factorization of a square matrix using partial pivoting and gaussean elimination. The coefficient matrix A can be decomposed into an upper triangualr matrix U and a lower triangular matrix L. The function decomposes the coefficient matrix A into the following relation:

[P][A] = [L][U]

Where P is the pivot matrix.

**Inputs:**
* A-coefficient matrix

**Outputs:**
* L-lower triangular matrix
* U-upper triangular matrix
* P-the pivot matrix

**Limitations:**
* The coefficient matrix A must be square
