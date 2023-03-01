function s=norm(bina);
%NORM Frobenius norm of a binary fixed point matrix

% we are just able to compute the Frobenius norm (no SVD)

%
% Author G. Meurant
% May 2020
%

[na,ma] = size(bina);

binb = bina .* bina;

su = sum(sum(binb));

s = sqrt(su);

