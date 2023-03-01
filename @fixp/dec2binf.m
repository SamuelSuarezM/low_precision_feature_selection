function bin=dec2binf(x,nbits);
%DEC2BINF converts a double float to binary fixed point

% the mantissa of bin has nbits bits

% dependancies: float2binfb

%
% Author G. Meurant
%

[b,bin] = float2binfb(x,nbits);

