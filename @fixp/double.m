function x = double(bin);
%DOUBLE double precision value of binary fixed point bin

%
% Author G. Meurant
% April 2020
%

[n,m]= size(bin);

if n == 1 && m == 1
 x = binf2dec(bin);
else
 x = binf2decm(bin);
end % if

