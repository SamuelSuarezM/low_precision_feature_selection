function bin = fixp(x,nbits);
%FIXP constructor for the class fixp, binary fixed point arithmetic

% x is a double precision scalar or matrix

% bin is a structure with fields: sign, I, F, float, nbits
% I and F are the (binary) integer and fractional (significand) parts
% float is the corresponding (rounded) double value
% nbits is the number of bits of the fractional part

% dependancies: fix_dec2binf, fix_dec2binfm

%
% Author G. Meurant
% April 2020
%

global round_mode

if isa(x,'fixp')
 bin = x;
 bin = class(bin,'fixp');
 return
end % if

% if nargin == 2
%  round_mode = 1;
% else
%  round_mode = rounding;
% end % if

if isempty(round_mode)
 round_mode = 1;
end % if

% if ~isfloat(x)
%  error(' fixp: the input must be a double or a fixp')
% end % if

[n,m] = size(x);

if n == 1 && m == 1
 bin = fix_dec2binf(x,nbits);
 bin = class(bin,'fixp');
 
else
 bin = fix_dec2binfm(x,nbits);
 bin = class(bin,'fixp');
end % if



