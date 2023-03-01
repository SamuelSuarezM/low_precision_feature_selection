function binc = div_binfms(bina,binb);
%DIV_BINFMS division of a matrix by a scalar, binary fixed point numbers

% bina / binb, binb is a scalar

% dependancies: div_binf

%
% Author G. Meurant
% April 2020
%

[rowa,cola] = size(bina); % number of rows and columns
[rowb,colb] = size(binb);
if rowb ~= 1 || colb ~= 1
 error(' div_binfms: binb must be a scalar')
end % if

% Create a binary element and set its parameters
binc = bina;

for i = 1:rowa
 for j = 1:cola
  binc(i,j) = div_binf(bina(i,j),binb);
 end % for j
end % for i