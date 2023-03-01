function binc = cot(bina);
%COT componentwise cotangent of a binary fixed point numbera or matrix

% input in radians

% uses tan = sin / cos, but this is cheating.......

% dependancies: cot_binfl

%
% Author G. Meurant
% May 2020
%

[na,ma] = size(bina);

if na == 1 && ma == 1
 binc = cot_binf(bina);
 
else
 binc = bina;
 [na,ma] = size(bina);
 for i = 1:na
  for j = 1:ma
   binc(i,j) = cot_binf(bina(i,j));
  end % for j
 end % for j
 
end % if



