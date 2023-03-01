function binc = div_binfm(bina,binb);
%DIV_BINFM componentwise division of two matrices of binary fixed point numbers

% dependancies: div_binf

%
% Author G. Meurant
% April 2020
%

[rowa,cola] = size(bina); % number of rows and columns
[rowb,colb] = size(binb);
if rowa ~= rowb || cola ~= colb
 error(' div_binfm: incompatible dimensions of inputs')
end % if

% Create a binary element and set its parameters
binc = bina;

for i = 1:rowa
 for j = 1:cola
  binc(i,j) = div_binf(bina(i,j),binb(i,j));
 end % for j
end % for i