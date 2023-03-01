function printfix(bin)
%PRINTFIX print the fields of binary fixed point

%
% Author G. Meurant
% April 2020

[n,m] = size(bin);

if n == 1 && m == 1
 fprintf(' sign = %d \n',bin.sign)
 fprintf(' I = %s \n',fix_bin2str(bin.I))
 fprintf(' F = %s \n',fix_bin2str(bin.F))
 fprintf(' float = %12.5e \n',bin.float)
 fprintf(' nbits = %d \n\n',bin.nbits)

else
 fprintf(' %d by %d array \n\n',n,m)
 
end % if
