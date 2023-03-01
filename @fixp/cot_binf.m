function binc=cot_binf(bina);
%COT_BINF cotangent function for a binary fixed point number

% dependancies: tan_binf

% uses cot = cos / sin, but this is cheating.......

%
% Author G. Meurant
% May 2020
%

nbits = bina.nbits;
one = fixp(1,nbits);

binc = div_binf(one, tan_binf(bina));

