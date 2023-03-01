function binc = plus(bina,binb);
%PLUS addition of two binary fixed point numbers or matrices

% dependancies: add_binf, add_binfm

%
% Author G. Meurant
% April 2020
%

if ~isa(bina,'fixp')
 bina = fixp(bina,binb(1).nbits);
 %bina = posit(bina,binb(1).nbits);
end % if 

if ~isa(binb,'fixp')
 binb = fixp(binb,bina(1).nbits);
 %binb = posit(binb,bina(1).nbits);
end % if 

[na,ma] = size(bina);
[nb,mb] = size(binb);

if na == 1 && ma == 1 && nb == 1 && mb == 1 % scalar case
 binc = add_binf(bina,binb);
 return
end % if

if na == 1 && ma == 1 && (nb ~= 1 || mb ~= 1) % scalar + matrix
 binc = binb;
 for i = 1:nb
  for j = 1:mb
   binc(i,j) = add_binf(bina, binb(i,j));
  end % for j
 end % for i
 return
end % if

if nb == 1 && mb == 1 && (na ~= 1 || ma ~= 1) % matrix + scalar
 binc = bina;
 for i = 1:na
  for j = 1:ma
   binc(i,j) = add_binf(binb, bina(i,j));
  end % for j
 end % for i
 return
end % if

% matrix + matrix

binc = add_binfm(bina,binb);




