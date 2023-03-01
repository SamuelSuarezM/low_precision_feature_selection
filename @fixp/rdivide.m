function binc = rdivide(bina,binb);
%RDIVIDE componentwise division of two binary fixed point numbers or matrices
% bina ./ binb

% dependancies: div_binf, div_binfm

%
% Author G. Meurant
% April 2020
%

[na,ma] = size(bina);
[nb,mb] = size(binb);

if na ~= nb || ma ~= mb  % #### Default: if na ~= nb || nb ~= mb
 error(' the two inputs must have the same size')
end % if

if na == 1 && ma == 1
 binc = div_binf(bina,binb);
else
 binc = div_binfm(bina,binb);
end % if



