function binc = mul_binfo(bina,binb);
%MUL_BINFO outer product of two vectors of binary fixed point numbers

% Both inputs must have the same parameters (nbits and es). The result will also have
% the same parameters

% dependancies: mul_binf

%
% Author G. Meurant
% April 2020
%

nbits = min(bina(1).nbits,binb(1).nbits);

[rowa,cola] = size(bina); % number of rows and columns
[rowb,colb] = size(binb);

if cola ~= 1
 bina = bina';
end % if

if rowb ~= 1
 binb = binb';
end % if

% Create a binary element and set its parameters
binc = fixp(zeros(rowa,colb),nbits);

for i = 1:rowa
 for j = 1:colb
  binc(i,j) = mul_binf(bina(i),binb(j));
 end % for j
end % for i