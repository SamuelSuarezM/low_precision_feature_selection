function binc = tan(bina);
%TAN componentwise tangent of a binary fixed point numbera or matrix

% input in radians

% uses tan = sin / cos, but this is cheating.......

% dependancies: tan_binf

%
% Author G. Meurant
% May 2020
%

[na,ma] = size(bina);

if na == 1 && ma == 1
 binc = tan_binf(bina);
 
else
 binc = bina;
 [na,ma] = size(bina);
 for i = 1:na
  for j = 1:ma
   binc(i,j) = tan_binf(bina(i,j));
  end % for j
 end % for j
 
end % if



