function [x,xf]=binf2dec(bin);
%BINF2DEC converts a fixed point binary number (structure) to a float (double)

% similar to p_bin2float

% bin is a binary fixed point number

% bin is a structure bin.sign, bin.I, bin.F containg binary numbers
% representing the sign, the integer part and the fractional part

% I could have returned bin.float, but this is cheating

% x and xf can be different if xf cannot be represented exactly and if the
% number of bits in bin is too small for that

% Note that bin.float may or may not have been computed

%
% Author G. Meurant
% April 2020
%

x = f_d_bin2dec(bin.I) + f_d_bin2frac(bin.F); % add the integer and fractional parts (as positive numbers)

if bin.sign == 1
 x = -x;
end % if

if nargout == 2
 xf = bin.float;
end % if

