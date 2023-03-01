function binc=tan_binf(bina);
%TAN_BINF tangent function for a binary fixed point number

% dependancies: binf2dec, sin_binf, cos_binf

% uses tan = sin / cos, but this is cheating.......

%
% Author G. Meurant
% May 2020
%

nbits = bina.nbits;

dec = binf2dec(bina);
dec = abs(dec);
dec = mod(dec,2*pi);

if abs(dec - pi/2) < 2^(-nbits)
 fprintf(' tan_binf: caution, the tangent is large, may be Inf \n')
 binc = fixp(1e300,nbits); % ???????
 return
end % if

if abs(dec - 3*pi/2) < 2^(-nbits)
 fprintf(' tan_binf: caution, the tangent is large, may be -Inf \n')
 binc = fixp(-1e300,nbits); % ???????
 return
end % if

binc = div_binf(sin_binf(bina), cos_binf(bina));

