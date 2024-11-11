% Name: Dhanvarshini Ramesh
% Matriculation Number: 3762374

% Exercise 01.2: Vectors and Matrices

% (a) Vectors:
% Creating a vector a & b
a = [1 2 3 4 5] ;
b = [0; 1; 3; 6; 10] ;

% Transpose of a & b
TransOfa = a'
TransOfb = b'

% Cumulative sum of a
CumSumOfA = cumsum(a)

% Differences of b using diff
DiffOfB = diff(b)


% (b) More vector operations:
% Multiplying a*a 
% We can't multiply 'a' vector with 'a' , because a vector is 5 * 1
% [ 5 columns and 1 row] , to mutiply with another vector the row of the
% first matrix must be identical to the row of the second matrix.
% Hence here, we can't multiply since [ 5*1 * 5*1] 1!=5.
% We can multiply 'a' with its transpose 
MultiplyingA = a * a'

% Multiplying a element with itself 
ElementwiseA = a .* a

% the third power of each element of a
Third_of_each_element_in_a = a .^ 3

% Computing the inner product of a and b
InnerProduct = a * b

% Computing the outer product of a and b, result to M
M = b * a


% (c) Workspace:
% Listing the variables using 'whos'
whos a b M


% (d) Matrices:
% 2nd row and its 4th column 
SecRow = M(2,:)
FourthEleColm2 = SecRow(4) 

% Submatrix 1,3,5 rows and last 3 columns 
SubMatrix = M([1,3,5], 3:end)


% (e) Matrix operations:
% Inversing M matrix
InverseOfM = inv(M) ;
% The matrix is Singular, Determinant of the matrix is 0. Hence cant be
% inverted


% (f) Relational operators:
% All no greater than 9 = -1
M(M > 9) = -1


% (g) Size:
% Size of a,b and M
SizeOfaRow = size(a,1)
SizeOfaColm = size(a,2)
SizeofbRow = size(b,1)
SizeofbColm = size(b,2)
SizeOfMRow = size(M,1)
SizeOfMColm = size(M,2)

% Ones and random in the size of M
OnesSizeOfM = ones(size(M))
NormDistRandOfM = randn(size(M))