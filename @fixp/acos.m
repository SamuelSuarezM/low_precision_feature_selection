function binc = acos(bina);
%ACOS componentwise inverse cosine of a binary fixed point numbera or matrix

% input in radians

% dependancies: acos_binf

%
% Author G. Meurant
% May 2020
%

[na,ma] = size(bina);

if na == 1 && ma == 1
 binc = acos_binf(bina);
 
else
 binc = bina;
 [na,ma] = size(bina);
 for i = 1:na
  for j = 1:ma
   binc(i,j) = acos_binf(bina(i,j));
  end % for j
 end % for j
 
end % if



