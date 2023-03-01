% @FIXP
%
% Files
%   abs             - absolute value of a binary fixed point number
%   acos            - componentwise inverse cosine of a binary fixed point number or matrix
%   acos_binf       - inverse cosine function for a binary fixed point number
%   acot            - componentwise inverse tangent of a binary fixed point number or matrix
%   acot_binf       - inverse cotangent function for a binary fixed point number
%   add_binf        - addition of two fixed point binary numbers
%   add_binfm       - addition of two matrices of binary fixed point numbers
%   asin            - componentwise inverse sine of a binary fixed point number or matrix
%   asin_binf       - inverse sine function for a binary fixed point number
%   atan            - componentwise inverse tangent of a binary fixed point number or matrix
%   atan_binf       - inverse tangent function for a binary fixed point number
%   bin2frac        - converts the input array to a fractional part
%   binary          - print the fields of a fixed point number
%   binf2dec        - converts a fixed point binary number (structure) to a float (double)
%   binf2decm       - binary fixed point to double matrix
%   binf_inv_Newton - computation of binary fixed point 1/d by Newton iteration with normalization
%   ceil_binf       - ceil for a binary fixed point number
%   cos             - componentwise cosine of a binary fixed point number or matrix
%   cos_binf        - cos function for a binary fixed point number
%   cot             - componentwise cotangent of a binary fixed point number or matrix
%   cot_binf        - cotangent function for a binary fixed point number
%   ctranspose      - transpose of a (real) binary fixed point matrix
%   dec2binf        - converts a double float to binary fixed point
%   dec2binfm       - double to binary fixed point matrix
%   diag            - diagonal function for a binary fixed point matrix or vector
%   disp            - displays the binary fixed point as a double
%   display         - for fixp
%   div_binf        - division of binary fixed point numbers diva / divb
%   div_binfm       - componentwise division of two matrices of binary fixed point numbers
%   div_binfms      - division of a matrix by a scalar, binary fixed point numbers
%   dot_binf        - dot product of two binary fixed point vectors
%   double          - double precision value of binary fixed point bin
%   exp             - componentwise exponential of a binary fixed point number or matrix
%   exp_binf        - exponential of a binary fixed point number
%   find_min_max    - find the first and last significand bits in bin
%   fix_binf        - fix for binary fixed point numbers
%   fixp            - constructor for the class fixp, binary fixed point arithmetic
%   float2binfb     - conversion of a float (double) to fixed point binary
%   floor_binf      - floor for a binary fixed point number
%   inv             - inverse of a binary fixed point matrix
%   iszero_binf     - returns true (1) if the fixed point binary number is zero
%   ldivide         - binb .\ bina
%   log             - componentwise natural logarithm of a binary fixed point number or matrix
%   log10           - componentwise base 10 logarithm of a binary fixed point number or matrix
%   log_binf        - natural logarithm of a fixed point number
%   lu              - Triangular factorization, fixed point numbers
%   lu_solver_binf  - linear solve for binary fixed point
%   mat_prod_binf   - matrix-matrix product
%   minus           - subtraction of two binary fixed point numbers or matrices
%   minus_binf      - subtraction of two fixed point binary numbers, bina - binb
%   minus_binfm     - subtraction of two matrices of binary fixed point numbers
%   mldivide        - division of two binary fixed point numbers or matrices
%   mpower          - bina ^ p for fixed point numbers
%   mrdivide        - division of two binary fixed point numbers or matrices
%   mtimes          - product of two binary fixed point numbers or matrices
%   mul_binf        - product of two fixed point numbers
%   mul_binfm       - componentwise multiplication of two matrices of binary fixed point numbers
%   mul_binfo       - outer product of two vectors of binary fixed point numbers
%   mul_binfsm      - componentwise multiplication of a scalar and a matrix of binary fixed point numbers
%   norm            - Frobenius norm of a binary fixed point matrix
%   plus            - addition of two binary fixed point numbers or matrices
%   pow2            - power of 2 in seed 
%   power           - bina .^ p for fixed point numbers
%   printfix        - print the fields of binary fixed point
%   prod            - prod of vector or matrix binary fixed point numbers
%   rdivide         - componentwise division of two binary fixed point numbers or matrices
%   round2int       - round the binary fixed point number to the nearest integer
%   sin             - componentwise sine of a binary fixed point number or matrix
%   sin_binf        - sine function for a binary fixed point number
%   sqrt            - componentwise square root of a binary fixed point number or matrix
%   sqrt_binf       - square root of a binary fixed point number
%   subsasgn        - for binary fixed point
%   subsref         - for binary fixed point
%   sum             - sum of vector or matrix binary fixed point numbers
%   tan             - componentwise tangent of a binary fixed point number or matrix
%   tan_binf        - tangent function for a binary fixed point number
%   times           - componentwise product of two binary fixed point numbers or matrices
%   trace           - trace of a binary fixed point matrix
%   tril            - lower triangular part of a binary fixed point matrix
%   triu            - upper triangular part of a binary fixed point matrix
%   uminus          - change signs of bina
%   uplus           - do not change signs of bina
