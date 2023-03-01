function binc=trace(bina);
%TRACE trace of a binary fixed point matrix

%
% Author G. Meurant
% April 2020
%

d = diag(bina);
binc = sum(d);

