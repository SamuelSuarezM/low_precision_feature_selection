function binc = mldivide(bina,binb);
%MLDIVIDE  division of two binary fixed point numbers or matrices
% bina \ binb = binb / binba for scalars

% dependancies: div_binf, div_binf, lu, lu_solver_binf

%
% Author G. Meurant
% April 2020
%

nbits = bina(1,1).nbits;
[na,ma] = size(bina);
[nb,mb] = size(binb);

if na == 1 && ma == 1 && nb == 1 && mb == 1
 % two scalars
 binc = div_binf(binb,bina);
 
else
 if na ~= ma
  error(' mldivide: bina must be a square matrix')
 end % if
 if na ~= nb
  error(' mldivide: incompatible dimensions')
 end % if
 
 % LU factorization of bina
 [L,U,P,p] = lu(bina);
 binc = fixp(zeros(na,mb),nbits);
 for k = 1:mb
  binc(:,k) = lu_solver_binf(binb(:,k),L,U,p);
 end % for k
 
end % if



