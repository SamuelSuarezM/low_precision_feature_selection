function binc=power(bina,p);
%POWER bina .^ p for fixed point numbers

% p can only be an integer 

%
% Author G. Meurant
% May 2020
%

[n,m] = size(p);
if n ~= 1 || m ~= 1
 error(' power: the second argument must be a scalar')
end % if

% if ~isequal(uint64(p),p)
%  error(' power: the second argument must be an integer')
% end % if

bin = fixp(p,bina(1).nbits);

[na,ma] = size(bina);
binc = bina;

for i = 1:na
 for j = 1:ma
  binc(i,j) = exp(mul_binf(bin, log(bina(i,j))));
 end % for j
end % for j

