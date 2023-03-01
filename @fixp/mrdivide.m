function binc = mrdivide(bina,binb);
%MRDIVIDE  division of two binary fixed point numbers or matrices
% bina / binb

% dependancies: div_binf, div_binfm

%
% Author G. Meurant
% April 2020
%

[na,ma] = size(bina);
[nb,mb] = size(binb);

% if na ~= nb || ma ~= mb
%  error(' the two inputs must have the same size')
% end % if

if na == 1 && ma == 1 && nb == 1 && mb == 1
 binc = div_binf(bina,binb);
 
else
  if nb ~= mb
  error(' mrdivide: binb must be a square matrix')
 end % if
 if ma ~= mb && (mb && nb) ~= 1  % ####### ENGADIDO ###########
  error(' mrdivide: incompatible dimensions')
 else
     binc = div_binfms(bina,binb);
     return
 end % if
 
 
 binbt = ctranspose(binb);
 binta = ctranspose(bina);
 y = mldivide(binbt, binta);
 binc = ctranspose(y);
 
end % if



