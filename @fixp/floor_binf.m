function binc=floor_binf(bina);
%FLOOR_BINF floor for a binary fixed point number

% dependancies: minus_binf

%
% Author G. Meurant
% April 2020
%

[na,ma] = size(bina);
nbits = bina.nbits;

binc = bina;

for i = 1:na
 for j = 1:ma
  binc(i,j).F = zeros(1,nbits); % zero the significand
  
  if binc(i,j).sign == 1
   binc(i,j) = minus_binf(binc(i,j), fixp(1,nbits));
   
  else
   binc(i,j).float = binf2dec(binc(i,j));
  end % if
  
 end % for j
end % for i



