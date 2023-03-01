function binc=sin_binf(bina);
%SIN_BINF sine function for a binary fixed point number

% dependancies: binf2dec, round2int, add_binf, mul_binf, floor_binf

%
% Author G. Meurant
% April 2020
%

nbits = bina.nbits;

dec = binf2dec(bina);
dec1 = dec;
dec = abs(dec);
dec = mod(dec,2*pi);

if dec <= 2^(-nbits)
 binc = fixp(0,nbits);
 return
end % if

if abs(dec - pi/2) <= 2^(-nbits) 
 binc = fixp(1,nbits);
 return
end % if

if abs(dec - 3*pi/2) <= 2^(-nbits)
 binc = fixp(-1,nbits);
 return
end % if

if abs(dec - pi) <= 2^(-nbits)
 binc = fixp(0,nbits);
 return
end % if

% convert dec back to binary fixed point (???????)
bina = fixp(dec1,nbits);


pi1 = fixp(0.31830988618379067154,nbits); % 1 / pi

sigp = bina.sign;
if sigp == 0
 sig = 1;
else
 sig = -1;
end % if

y = abs(bina);
n = round2int(mul_binf(y,pi1));

x1 = floor_binf(y); 
x2 = minus_binf(y,x1);
c1 = fixp(3217 / 1024,nbits);
c2 = fixp(-8.908910206761537356617e-6,nbits);

f = minus_binf( add_binf( minus_binf(x1, mul_binf(n,c1)), x2), mul_binf(n,c2)); % ( (x1 - n * c1) + x2) - n * c2

s1 = fixp(-1.66666666666666324348e-01,nbits);
s2 = fixp(8.33333333332248946124e-03,nbits);
s3 = fixp(-1.98412698298579493134e-04,nbits);
s4 = fixp(2.75573137070700676789e-06,nbits);
s5 = fixp(-2.50507602534068634195e-08,nbits);
s6 = fixp(1.58969099521155010221e-10,nbits);

if binf2dec(bina) == 0
 binc = fixp(0,nbits);
 return
end % if

fd = binf2dec(f);
if abs(fd) > 2^(-32)
 
 z = mul_binf(f,f);
 v =  mul_binf(z,f);
 r =  add_binf(s2, mul_binf(z, add_binf(s3, mul_binf(z, add_binf(s4, mul_binf(z, add_binf(s5, mul_binf(z,s6)))))))); % r =  s2 + z * (s3 + z * (s4 + z * (s5 + z * s6)))
 binc = add_binf(f, mul_binf(v ,(add_binf(s1, mul_binf(z,r))))); % s = f + v * (s1 + z * r)
 
else
 
 binc = f;
 
end % if

if sig ~= 1
 binc.sign = ~f.sign;
 binc.float = -binc.float;
else
 binc.sign = f.sign;
end % if

if mod(n.float,2) ~= 0
 binc.sign = ~binc.sign;
 binc.float = -binc.float;
end % if


