function binc = uminus(bina);
%UMINUS change signs of bina

%
% Author G. Meurant
% May 2020
%

[na,ma] = size(bina);

binc = bina;

for i =1:na
 for j =1:ma
  binc(i,j).sign = ~binc(i,j).sign;
 end % for j
end % for i

