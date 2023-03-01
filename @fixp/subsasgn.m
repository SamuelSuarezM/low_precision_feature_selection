function X = subsasgn(X,S,Y)
%SUBSASGN for binary fixed point

if isa(Y,'fixp')
 Y = binf2decm(Y);
end % if

Xd = binf2decm(X);
Xd = subsasgn(Xd,S,Y);
nbits = X(1).nbits;
X = fixp(Xd,nbits);
