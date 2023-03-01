function binc=log_binf(bina);
%LOG_BINF natural logarithm of a fixed point number

% dependancies: binf2dec, add_binf, mul_binf

%
% Author G. Meurant
% April 2020
%

if bina.sign == 1
 error(' log_binf: bina must be a positive number')
end % if

nbits = bina.nbits;

ln2 = fixp(0.69314718055994528622676398299518,nbits); % log(2)

dec = binf2dec(bina);
pow = log2(dec);
if abs(2^pow - dec) <= eps
 binc = mul_binf( fixp(pow,nbits), ln2);
 return
end % if

Lg1 = fixp(6.666666666666735130e-01,nbits);
Lg2 = fixp(3.999999999940941908e-01,nbits);
Lg3 = fixp(2.857142874366239149e-01,nbits);
Lg4 = fixp(2.222219843214978396e-01,nbits);
Lg5 = fixp(1.818357216161805012e-01,nbits);
Lg6 = fixp(1.531383769920937332e-01,nbits);
Lg7 = fixp(1.479819860511658591e-01,nbits);

% ln2_hi = 355 / 512;
% ln2_lo = -2.121944400546905827679e-4; % ln2_hi + ln2_lo = log(2)

[fd,ed] = log2(dec);
f = fixp(fd,nbits);
e = fixp(ed,nbits);
one = fixp(1,nbits);
f = minus_binf(f,one);
hfsq = mul_binf(f, mul_binf(f, fixp(0.5,nbits)));

two = fixp(2,nbits);
s = div_binf(f, add_binf(f,two));
z = mul_binf(s,s);
w = mul_binf(z,z);
t1 = mul_binf(w, add_binf(Lg2, mul_binf(w, add_binf(Lg4, mul_binf(w,Lg6) ))));
t2 = mul_binf(z, add_binf(Lg1, mul_binf(w, add_binf(Lg3, mul_binf(w, add_binf(Lg5, mul_binf(w,Lg7) ))))));
R = add_binf(t2,t1);

if ed == 0 
 binc = minus_binf(f, minus_binf(hfsq, mul_binf(s, add_binf(hfsq, R))) ); 
%  l = f - s * (f - R); 
else
% l = e * ln2_hi - ((hfsq - (s * (hfsq + R) + e * ln2_lo )) - f);
binc = minus_binf( mul_binf(e,ln2), minus_binf( minus_binf(hfsq, mul_binf(s, add_binf(hfsq, R) ) ), f));
% l = e * ln2 - ((s * (f - R) ) - f);
end % if


