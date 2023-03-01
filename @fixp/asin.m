function binc = asin(bina);
%ASIN componentwise inverse sine of a binary fixed point numbera or matrix

% input in radians

% dependancies: asin_binf

%
% Author G. Meurant
% May 2020
%

[na,ma] = size(bina);

if na == 1 && ma == 1
 binc = asin_binf(bina);
 
else
 binc = bina;
 [na,ma] = size(bina);
 for i = 1:na
  for j = 1:ma
   binc(i,j) = asin_binf(bina(i,j));
  end % for j
 end % for j
 
end % if



