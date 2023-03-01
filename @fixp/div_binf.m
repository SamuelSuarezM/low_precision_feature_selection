function [r,flag] = div_binf(diva,divb);
%DIV_BINF division of binary fixed point numbers diva / divb

% compute an approximation of the inverse of divb and multiply by diva

% this code uses an approximate inverse of divb 

% dependancies: binf_inv_Newton, mul_binf

% 
% Author G. Meurant
% April 2020
% 

divaI = diva.I;
divaF = diva.F;
divbI = divb.I;
divbF = divb.F;

flag = 0;
% if fix_iszero(divbI) && fix_iszero(divbF)
if (sum(divbI) == 0) && (sum(divbF) == 0)
 % division by zero
 fprintf(' div_binf: division by zero \n')
 flag = 1;
 r = diva;
 return
end % if

% if fix_iszero(divaI) && fix_iszero(divaF)
if (sum(divaI) == 0) && (sum(divaF) == 0)
 % return zero
 r = diva;
 return
end % if

absdivb = divb;
absdivb.sign = 0;

[r,flag] = binf_inv_Newton(absdivb); % Newton iteration for 1 / abs(divb)

if flag == 1
 r = diva;
 return
end % if

r.sign = divb.sign;
if r.sign == 1
 r.float = -r.float;
end % if

r = mul_binf(r, diva);

if length(r.I) > 512
 fprintf(' Caution: the integer part is larger than %g \n',2^512)
end % if


