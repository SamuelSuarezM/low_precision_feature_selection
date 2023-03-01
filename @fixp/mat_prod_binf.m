function binc = mat_prod_binf(bina,binb);
%MAT_PROD_BINF matrix-matrix product

% inputs are assumed to have compatible dimensions

%
% Author G. Meurant
% April 2020
%

[na,ma] = size(bina);
[nb,mb] = size(binb);

nbits = min(bina(1,1).nbits,binb(1,1).nbits);

% ma must be equal to na

binc = fixp(zeros(na,mb),nbits);

for i = 1:na
 for j = 1:mb
  s = fixp(0,nbits);
  
  for k = 1:ma
   s = add_binf(s, mul_binf(bina(i,k), binb(k,j)));
  end % for k
  
  binc(i,j) = s;
  
 end % for j
end % for i