function binc=fix_binf(bina);
%FIX_BINF fix for binary fixed point numbers

%
% Author G. Meurant
% April 2020
%

sig = bina.sign;

if sig == 0
 binc = floor_binf(bina);
 return
end %

binc = ceil_binf(bina);

