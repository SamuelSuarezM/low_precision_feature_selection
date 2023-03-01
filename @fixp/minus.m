function binc = minus(bina,binb);
%MINUS subtraction of two binary fixed point numbers or matrices

% dependancies: minus_binf, minus_binfm

%
% Author G. Meurant
% April 2020
%

if ~isa(bina,'fixp')
 bina = posit(bina,binb(1).nbits);
end % if 

if ~isa(binb,'fixp')
 binb = posit(binb,bina(1).nbits);
end % if 

[na,ma] = size(bina);
[nb,mb] = size(binb);

if na == 1 && ma == 1 && nb == 1 && mb == 1 % scalar case
 binc = minus_binf(bina,binb);
 return
end % if

if na == 1 && ma == 1 && (nb ~= 1 || mb ~= 1) % scalar - matrix
 binc = binb;
 for i = 1:nb
  for j = 1:mb
   binc(i,j) = minus_binf(bina, binb(i,j));
  end % for j
 end % for i
 return
end % if

if nb == 1 && mb == 1 && (na ~= 1 || ma ~= 1) % matrix - scalar
 binc = bina;
 for i = 1:na
  for j = 1:ma
   binc(i,j) = minus_binf(bina(i,j), binb);
  end % for j
 end % for i
 return
end % if

% matrix - matrix

binc = minus_binfm(bina,binb);




