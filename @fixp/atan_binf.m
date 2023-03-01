function binc=atan_binf(bina);
%ATAN_BINF inverse tangent function for a binary fixed point number

% dependancies: binf2dec, sin_binf, cos_binf

% uses the relation between atan and asin, but this is cheating.......

%
% Author G. Meurant
% May 2020
%

nbits = bina.nbits;
one = fixp(1,nbits);

den = sqrt_binf( add_binf(one, mul_binf(bina, bina)));

binc = asin_binf( div_binf(bina, den));

