function Z = subsref(X,S)
%SUBSREF for binary fixed point

if isequal(S.type,'.')
 Z = X;
else
 nbits = X.nbits;
 Z = fixp(subsref(double(X),S),nbits);
end

