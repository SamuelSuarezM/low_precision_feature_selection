function binc=tril(bina,k);
%TRIL lower triangular part of a binary fixed point matrix

% no dependancies

%
% Author G. Meurant
% April 2020
%

if nargin == 1
 k = 0;
end % if

binc = bina;

nbits = bina.nbits;

[na,ma] = size(bina);

B = tril(ones(na,ma),k) == 0;

binc(B) = fixp(0,nbits);

