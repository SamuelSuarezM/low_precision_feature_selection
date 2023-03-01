function binc=mpower(bina,p);
%MPOWER bina ^ p for fixed point numbers

% p can only be an integer 

%
% Author G. Meurant
% May 2020
%

[n,m] = size(p);
if n ~= 1 || m ~= 1
 error(' mpower: the second argument must be a scalar')
end % if

binc = power(bina,p);

