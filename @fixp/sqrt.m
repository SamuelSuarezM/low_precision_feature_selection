function binc = sqrt(bina);
%SQRT componentwise square root of a binary fixed point number or matrix

% dependancies: sqrt_binf

%
% Author G. Meurant
% April 2020
%

[na,ma] = size(bina);

if na == 1 && ma == 1
 binc = sqrt_binf(bina);
 
else
 binc = bina;
 [na,ma] = size(bina);
 for i = 1:na
  for j = 1:ma
   binc(i,j) = sqrt_binf(bina(i,j));
  end % for j
 end % for j
 
end % if



