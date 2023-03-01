function binc = exp(bina);
%EXP componentwise exponential of a binary fixed point numbera or matrix

% dependancies: exp_binf

%
% Author G. Meurant
% April 2020
%

[na,ma] = size(bina);

if na == 1 && ma == 1
 binc = exp_binf(bina);
 
else
 binc = bina;
 [na,ma] = size(bina);
 for i = 1:na
  for j = 1:ma
   binc(i,j) = exp_binf(bina(i,j));
  end % for j
 end % for j
 
end % if



