function binc = log10(bina);
%LOG10 componentwise base 10 logarithm of a binary fixed point numbera or matrix

% dependancies: log_binf, div_binf

%
% Author G. Meurant
% April 2020
%

[na,ma] = size(bina);
nbits = bina.nbits;

l10 = fixp(2.302585092994045684017991455,nbits); % log(10)

if na == 1 && ma == 1
 binc = log_binf(bina);
 binc = div_binf(binc, l10);
 
else
 binc = bina;
 [na,ma] = size(bina);
 for i = 1:na
  for j = 1:ma
   binc(i,j) = log_binf(bina(i,j));
   binc(i,j) = div_binf(binc(i,j), l10);
  end % for j
 end % for j
 
end % if



