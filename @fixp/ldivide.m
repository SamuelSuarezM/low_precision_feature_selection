function binc=ldivide(bina,binb);
%LDIVIDE binb .\ bina

%
% Author G. Meurant
% May 2020
%

[na,ma] = size(bina);
[nb,mb] = size(binb);

if na ~= nb || ma ~= mb
 error(' ldivide: the inputs must have the same size')
end % if

binc = bina;

for i = 1:na
 for j = 1:mb
  binc(i,j) = div_binf(binb(i,j), bina(i,j));
 end % for j
end % for j

