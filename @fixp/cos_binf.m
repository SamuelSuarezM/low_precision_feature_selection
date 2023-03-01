function binc=cos_binf(bina);
%COS_BINF cos function for a binary fixed point number

% dependancies: sin_bf, minus_binf, mul_binf, sqrt_binf

%
% Author G. Meurant
% April 2020
%

nbits = bina.nbits;

s = sin_binf(bina); % sine

% c = sqrt(1 - s^2);  this is to maintain s^2 + c^2 = 1 to working precision
% if s is close to 1, 1 - s^2 can be negative

one = fixp(1,nbits);
os = minus_binf( one, mul_binf(s,s));

if os.float == 0
 binc = fixp(0,nbits);
 return
 
elseif os.float < 0
 os.sign = 0;
 os.float = abs(os.float);
end % if

binc = sqrt_binf(os); % this is > 0

y = abs(bina);
z = rem(binf2dec(y),2*pi);

if z > pi/2 && z < 3*pi/2
 binc.sign = ~binc.sign;
 binc.float = -binc.float;
end % if

