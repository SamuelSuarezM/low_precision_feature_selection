function s = dot_binf(binav,binbv);
%DOT_BINF dot product of two binary fixed point vectors

% the result may not be accurate. If not use quires

% binav and binbv must have the same parameters

%
% Author G. Meurant
% March 2020
%

na = length(binav);
nb = length(binbv);
if na ~= nb
 error(' dot_binf: the two binary vectors must have the same length')
end % if

nbitsa = binav.nbits;
nbitsb = binbv.nbits;
if nbitsa ~= nbitsb
 error(' dot_binf: the two binary vectors must have the same parameters')
end % if

s = fixp(0,nbitsa); % s = 0

% We could have use mulv for the product and then sum

for k = 1:na
 product = mul_binf(binav(k),binbv(k));
 s = add_binf(s,product);
end % for k

