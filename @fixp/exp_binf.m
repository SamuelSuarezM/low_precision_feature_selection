function binc=exp_binf(bina);
%EXP_BINF exponential of a binary fixed point number

% dependancies: binf2dec, round2int, add_binf, mul_binf

%
% Author G. Meurant
% April 2020
%

y = abs(bina);
decp = binf2dec(bina);
decy = abs(decp);
nbits = bina.nbits;

if decy < 2^(-nbits)
 binc = fixp(1,nbits);
 return
end % if

if decp > 700
 error(' exp_binf: bina is too large') 
end % if

if decp < 0 && decy > 750
 binc = fixp(0,nbits);
 return
end % if

% ln2 = 0.69314718055994528622676398299518; % log(2)

% ln21 = 1.4426950408889634073599246810018921374; % 1 / log(2)
ln21 = fixp(1.4426950408889634073599246810018921374,nbits);

% c1 = 0.693359375000000000; % 355 / 512
c1 = fixp(0.693359375000000000,nbits);
% c2 = -2.121944400546905827679e-4;
c2 = fixp(-2.121944400546905827679e-4,nbits); % c1 + c2 = log(2)

n = round2int( mul_binf(bina, ln21)); % round to nearest integer
decn = binf2dec(n);

g = minus_binf( (minus_binf(bina, mul_binf(n,c1))), mul_binf(n,c2)); % (p - n * c1) - n * c2;

p1 = fixp(1.66666666666666019037e-01,nbits);
p2 = fixp(-2.77777777770155933842e-03,nbits);
p3 = fixp(6.61375632143793436117e-05,nbits);
p4 = fixp(-1.65339022054652515390e-06,nbits);
p5 = fixp(4.13813679705723846039e-08,nbits); 

t = mul_binf(g,g); 

% c  = g - t * (p1 + t * (p2 + t * ( p3 + t * (p4 + t * p5) ) ) );
c  = minus_binf(g, mul_binf(t, add_binf(p1, mul_binf(t, add_binf(p2, mul_binf(t, add_binf(p3, mul_binf(t, add_binf(p4, mul_binf(t,p5) ) ) ) ) ) ) ) ) );

one = fixp(1,nbits);
two = fixp(2,nbits);
y = minus_binf(one, minus_binf( div_binf( mul_binf(g,c), minus_binf(c,two) ), g));  % 1 - ( [(g * c) / (c - 2)] - g); 

if decn == 0
 binc = y;
else
 n2 = fixp(2^decn,nbits);
 binc = mul_binf(y,n2); % ex = y * 2^n
end % if
 
 
 
 
 


