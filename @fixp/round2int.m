function binc=round2int(bina);
%ROUND2INT round the binary fixed point number to the nearest integer

% dependancies: binf2dec, add_binf, minus_binf

%
% Author G. Meurant
% April 2020
%

[na,ma] = size(bina);
nbits = bina.nbits;

binc = bina;

for i = 1:na
 for j = 1:ma
  y = abs(bina(i,j));
  dec = binf2dec(y);
  binc(i,j).F = zeros(1,nbits); % zero the significand
  if (dec - fix(dec)) >= 0.5
   if binc(i,j).sign == 1
    binc(i,j) = minus_binf(binc(i,j), fixp(1,nbits));
   else
    binc(i,j) = add_binf(binc(i,j), fixp(1,nbits));
   end % if
  end % if
  
  binc(i,j).float = binf2dec(binc(i,j));
  
 end % for j
end % for i


   
  