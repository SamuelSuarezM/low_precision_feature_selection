function binc=acos_binf(bina);
%ACOS_BINF inverse cosine function for a binary fixed point number

% dependancies: binf2dec, add_binf, mul_binf, div_binf

%
% Author G. Meurant
% May 2020
%

nbits = bina.nbits;

dec = binf2dec(bina);

if abs(dec) > 1
 error(' acos_binf: the argument must have an absolute value less than or equal to 1')
end % if

if abs(dec) < 2^(-nbits)
 binc = fixp(pi/2,nbits);
 return
end % if

if abs(dec - 1) < 2^(-nbits)
 binc = fixp(0,nbits);
 return
end % if

if abs(dec + 1) < 2^(-nbits)
 binc = fixp(pi,nbits);
 return
end % if

one = fixp(1,nbits);
two = fixp(2,nbits);
pif = fixp(pi,nbits);
onehalf = fixp(0.5,nbits);

if dec > 0.5
 binc = mul_binf(two, asin_binf(sqrt( mul_binf(onehalf, minus_binf(one, bina)))));
 return
end % if

if dec < -0.5
 binc = minus_binf(pif, mul_binf(two, asin_binf(sqrt( mul_binf(onehalf, add_binf(one, bina))))));
 return
end % if

pis2 = fixp(oi/2,nbits);
binc = minus_binf(pis2, asin_binf(bina));





