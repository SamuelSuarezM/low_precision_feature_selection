function binc=abs(bina);
%ABS absolute value of a binary fixed point number

%
% Author G. Meurant
% April 2020
%

binc = bina;

[na,ma] = size(bina);

for i = 1:na
 for j = 1:ma
  binc(i,j).sign = 0;
 end % for j
end % for j



