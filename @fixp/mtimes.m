function binc = mtimes(bina,binb);
%MTIMES product of two binary fixed point numbers or matrices

% binc = bina * binb

% dependancies: mul_binf

%
% Author G. Meurant
% April 2020
%

[na,ma] = size(bina);
[nb,mb] = size(binb);

if na == 1 && ma == 1 && nb == 1 && mb == 1 % scalar case
 binc = mul_binf(bina,binb);
 return
end % if

if na == 1 && ma == 1 % scalar * matrix
 binc = binb;
 for i = 1:nb
  for j = 1:mb
   binc(i,j) = mul_binf(bina, binb(i,j));
  end % for j
 end % for i
 return
end % if
   
if nb == 1 && mb == 1 % matrix * scalar
 binc = bina;
 for i = 1:na
  for j = 1:ma
   binc(i,j) = mul_binf(binb, bina(i,j));
  end % for j
 end % for i
 return
end % if

if (na ~= 1) && (ma == 1) && (nb == 1) && (mb ~= 1) % outer product of vectors
 binc = mul_binfo(bina,binb);
 return
end % if

% matrix * matrix case

binc = mat_prod_binf(bina,binb);




