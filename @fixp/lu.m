function [L,U,P,p] = lu(A);
%LU  Triangular factorization, fixed point numbers

%   [L,U,P] = lu(A) produces a unit lower triangular matrix L,
%   an upper triangular matrix U, and a permutation vector p,
%   so that L*U = P * A

% p is the permutation vector

[n,n] = size(A);
p = (1:n)';

nbits = A.nbits;

for k = 1:n-1
 
 % Find index of largest element below diagonal in k-th column
 [r,m] = max(abs(binf2decm(A(k:n,k)))); 
 m = m + k - 1;
 
 % Skip elimination if column is zero
 if binf2dec(A(m,k)) ~= 0
  
  % Swap pivot row
  if m ~= k
   A([k m],:) = A([m k],:);
   p([k m]) = p([m k]);
  end
  
  % Compute multipliers
  i = k+1:n;
  A(i,k) = div_binfms(A(i,k), A(k,k)); % division of a vector by a scalar
  
  % Update the remainder of the matrix
  j = k+1:n;
  A(i,j) = minus_binfm(A(i,j), mul_binfo(A(i,k), A(k,j))); % subtraction of an outer product
 end
end

% Separate result
I = fix_eye(nbits,n);
L = add_binfm(tril(A,-1), I); 
U = triu(A);

% construct P 
P = I(:,p);
