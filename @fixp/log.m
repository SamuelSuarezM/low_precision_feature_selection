function binc = log(bina);
%LOG componentwise natural logarithm of a binary fixed point numbera or matrix

% dependancies: log_binf

%
% Author G. Meurant
% April 2020
%

[na,ma] = size(bina);

if na == 1 && ma == 1
 binc = log_binf(bina);
 
else
 binc = bina;
 [na,ma] = size(bina);
 for i = 1:na
  for j = 1:ma
   binc(i,j) = log_binf(bina(i,j));
  end % for j
 end % for j
 
end % if



