function binc=add_binf(bina,binb);
%ADD_BINF addition of two fixed point binary numbers

% bin is a structure bin.sign, bin.I, bin.F, bin.float containing binary numbers
% representing the sign, the integer part and the fractional part as well
% as the double precision value if available

% in this function bina and binb must have the same nbits and we do not
% remove the trailing zero bits

% dependancies: f_d_add_bin_carry, minus_binf

%
% Author G. Meurant
% April 2020
%

if bina(1,1).nbits ~= binb(1,1).nbits
 error(' add_binf: the two inputs must have the same value of nbits')
end % if


siga = bina.sign;
Ia = bina.I;
Fa = bina.F;
sigb = binb.sign;
Ib = binb.I;
Fb = binb.F;

if iszero_binf(bina) == 1
 binc = binb;
 return
end % if
if iszero_binf(binb) == 1
 binc = bina;
 return
end % if


if (siga == 0 && sigb == 0) || (siga == 1 && sigb == 1)
 % two positive or two negative numbers
 
 xf = bina(1,1).float + binb(1,1).float; % could be []

 binc = bina;
 
 % add the fractional parts
 nFa = length(Fa);
 nFb = length(Fb);
 
 % pad the smallest one with zeros
 nF = max(nFa,nFb);
 Fa = [Fa, zeros(1,nF - nFa)];
 Fb = [Fb, zeros(nF - nFb)];
 
 % add the two binary strings
 [Fab,cnext] = f_d_add_bin_carry(Fa,Fb,0);

 % is there a carry out? if yes remove it, it goes to I
 if cnext == 1
  Fab = Fab(2:end);
 end % if
 
 % add the integer parts
 nIa = length(Ia);
 nIb = length(Ib);
 
 % pad the smallest one with zeros
 nI = max(nIa,nIb);
 Ia = [zeros(1,nI - nIa), Ia];
 Ib = [zeros(1,nI - nIb), Ib];

 
 % add the two binary strings (with the carry in from F)
 [Iab,cnext] = f_d_add_bin_carry(Ia,Ib,cnext);
 
 % remove the leading zeros
 lI = length(Iab);
 lF = length(Fab);
 
 ind = find(Iab);
 if ~isempty(ind)
  minI = ind(1);
  Iab = Iab(minI:end);
 else
  Iab = [];
 end % if
  
 binc.I = Iab;
 binc.F = Fab;
 binc.float = binf2dec(binc);
  
else
 
 % one is positive and one negative
 if siga == 1
  bina.sign = 0;
  bina.float = abs(bina.float);
  binc = minus_binf(binb,bina); 
  return
 end % if
 
 if sigb == 1
  binb.sign = 0;
  binb.float = abs(binb.float);
  binc = minus_binf(bina,binb);
  return
 end % if

end % if siga

if length(binc.I) > 512
 fprintf(' Caution: the integer part is larger than %g \n',2^512)
end % if






