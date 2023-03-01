function binc=asin_binf(bina);
%ASIN_BINF inverse sine function for a binary fixed point number

% dependancies: binf2dec, add_binf, mul_binf, div_binf

%
% Author G. Meurant
% May 2020
%

nbits = bina.nbits;

dec = binf2dec(bina);

if abs(dec) > 1
 error(' asin_binf: the argument must have an absolute value less than or equal to 1')
end % if

if abs(dec) < 2^(-nbits)
 binc = fixp(0,nbits);
 return
end % if

if abs(dec - 1) < 2^(-nbits)
 binc = fixp(pi/2,nbits);
 return
end % if

if abs(dec + 1) < 2^(-nbits)
 binc = fixp(-pi/2,nbits);
 return
end % if

if abs(dec) < 2^(-nbits/2)
 binc = bina;
 return
end % if

pS0 = fixp(1.66666666666666657415e-01,nbits);
pS1 = fixp(-3.25565818622400915405e-01,nbits);
pS2 = fixp(2.01212532134862925881e-01,nbits);
pS3 = fixp(-4.00555345006794114027e-02,nbits);
pS4 = fixp(7.91534994289814532176e-04,nbits);
pS5 = fixp(3.47933107596021167570e-05,nbits);
qS1 = fixp(-2.40339491173441421878e+00,nbits);
qS2 = fixp(2.02094576023350569471e+00,nbits);
qS3 = fixp(-6.88283971605453293030e-01,nbits);
qS4 = fixp(7.70381505559019352791e-02,nbits);

one = fixp(1,nbits);
pis2 = fixp(pi/2,nbits);
two = fixp(2,nbits);

if abs(dec) < 0.5
 
 t = mul_binf(bina, bina);
 p = mul_binf(t, add_binf(pS0, mul_binf(t, add_binf(pS1, mul_binf(t, add_binf(pS2, mul_binf(t,...
  add_binf(pS3, mul_binf(t, add_binf(pS4, mul_binf(t, pS5)))))))))));
 q = add_binf(one, mul_binf(t, add_binf(qS1, mul_binf(t, add_binf(qS2, mul_binf(t, add_binf(qS3, mul_binf(t, qS4))))))));
 w = div_binf(p, q);
 binc =  add_binf(bina, mul_binf(bina, w));
 return
 
else
 w = minus_binf(one, abs(bina));
 t = mul_binf(w, fixp(0.5,nbits));
 p = mul_binf(t, add_binf(pS0, mul_binf(t, add_binf(pS1, mul_binf(t, add_binf(pS2,...
  mul_binf(t, add_binf(pS3, mul_binf(t, add_binf(pS4, mul_binf(t, pS5)))))))))));
 q =  add_binf(one, mul_binf(t, add_binf(qS1, mul_binf(t, add_binf(qS2, mul_binf(t, add_binf(qS3, mul_binf(t, qS4))))))));
 s = sqrt_binf(t);
 
 if abs(dec) > 0.975
  w = div_binf(p, q);
  t = minus_binf(pis2, mul_binf(two, add_binf(s, mul_binf(s, w))));
  
 else
  w  = s;
  c  = div_binf(minus(t, mul_binf(w, w)) , add_binf(s, w));
  r  = div_binf(p, q);
  t = minus_binf(pis2, mul_binf(two,  add_binf(minus_binf(mul_binf(s, r), c), w)));
 end % if
 
 binc = t;
 if dec < 0
  binc.sign = 1;
 end % if
 
end % if

