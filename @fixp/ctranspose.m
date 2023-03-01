function binc=ctranspose(bina);
%CTRANSPOSE transpose of a (real) binary fixed point matrix

% no dependancies

%
% Author G. Meurant
% April 2020
%

nbits = bina.nbits;
[na,ma] = size(bina);
binc = fixp(zeros(ma,na),nbits);

for i = 1:na
 for j = 1:ma
  binc(j,i) = bina(i,j);
 end % for j
end % for i

