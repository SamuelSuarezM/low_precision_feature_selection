function b=binary(bin);
%BINARY print the fields of a fixed point number

%
% Author G. Meurant
% May 2020

[n,m] = size(bin);

b = cell(n,m);

for i = 1:n
 for j = 1:m
  p = bin(i,j);
  sig = p.sign;
  I = p.I;
  if isempty(I)
   I = [0];
  end % if
  F = p.F;
  
  b(i,j) = {[ num2str(sig) ' ' fix_bin2str(I) ' ' fix_bin2str(F) ]};
 end % for j
end % for i

