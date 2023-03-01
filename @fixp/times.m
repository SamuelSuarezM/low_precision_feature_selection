function binc = times(bina,binb);
%TIMES componentwise product of two binary fixed point numbers or matrices

% binc = bina .* binb

% dependancies: mul_binf, mul_binfm
%
% Author G. Meurant
% April 2020
%

[na,ma] = size(bina);
[nb,mb] = size(binb);

% if na ~= nb || ma ~= mb
%  error(' times: the two inputs must have the same size')
% end % if
% 
% if na == 1 && ma == 1
%  binc = mul_binf(bina,binb);
%  
% else
%  binc = mul_binfm(bina,binb);
%  
% end % if

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

% matrix * matrix case

binc = mul_binfm(bina,binb);

