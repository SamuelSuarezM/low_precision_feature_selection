function binc=inv(bina);
%INV inverse of a binary fixed point matrix

%
% Author G. Meurant
% April 2020
%

[na,ma] = size(bina);

nbits = bina(1,1).nbits;

if na == 1 && ma == 1
 one = fixp(1,nbits);
 binc = div_binf(one, bina);
 return
end % if

if na ~= ma
 error(' inv: the matrix must be square')
end % if

binb= fix_eye(nbits,na,na);

binc = bina \ binb;

