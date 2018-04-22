function [L,U,P] = luFactor(A)
%[L,U,P] = luFactor(A)
%Function that determines the LU Factorization of a square matrix using
%partial pivoting and gaussean elimination
%Inputs:
%A-coefficient matrix
%Outputs:
%L-lower triangular matrix
%U-upper triangular matrix
%P-the pivot matrix

%Define values n and m based upon the size of the matrix inputted. These
%values will be useful when running loops later on, allowing the code to
%decompose larger matrices
[n,m] = size(A);
%The function automatically catches if there are too few/too many input
%arguments, so no error is necessary...
%Confirms that the matrix is square
if n~=m
    error('Matrix must be square');
end
%The starting matrices are defined
L = eye(n); U = A; P = L;
%The follwoing loops perform the decomposition
for i = 1:m
    %Identifies the maximum value in each column
    piv = max(abs(U(i:n,i)));
    %Defines the pivot row using the max value
    for j = i:n
        if piv == abs(U(j,i))
            piv_row = j;
        end
    end
    %Performs pivoting using row swapping for each matrix
    L([i piv_row],1:i-1) = L([piv_row i],1:i-1);
    U([i piv_row],:) = U([piv_row i],:);
    P([i piv_row],:) = P([piv_row i],:);
    %Performs elimination by first solving for the ratio, assigning the
    %ratio to the proper position in the L matrix, and then multiplying the
    %ratios through the proper U row. Finally, subtraction is performed,
    %completing the elimination
    for k = i+1:m
        L(k,i) = U(k,i)/U(i,i);
        U(k,:) = U(k,:) - L(k,i)*U(i,:);
    end
end
end