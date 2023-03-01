function binc = prod(bina,dim);
%PROD prod of vector or matrix binary fixed point numbers

%
% Author G. Meurant
% April 2020
%

[na,ma] = size(bina);
nbits = bina.nbits;
if nargin == 1
 dim = 1;
end % if

if na == 1 || ma == 1
 % vector case
 binc = fixp(1,nbits);
 for k = 1:max(na,ma)
  binc = mul_binf(binc, bina(k)); 
 end % for k
 return
end % if

if dim == 1
 % prod along the columns
 binc = fixp(zeros(1,ma),nbits);
 for j = 1:ma
  s = fixp(1,nbits);
  for k = 1:na
   s = mul_binf(s, bina(k,j)); 
  end % for k
  binc(j) = s;
 end % for j
 
else % dim = 2
 % prod along rows
 binc = fixp(zeros(na,1),nbits);
 for j = 1:na
  s = fixp(1,nbits);
  for k = 1:ma
   s = mul_binf(s, bina(j,k)); 
  end % for k
  binc(j) = s;
 end % for j
 
end % if

