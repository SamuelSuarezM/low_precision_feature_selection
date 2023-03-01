function binx=lu_solver_binf(binb,L,U,p);
%LU_SOLVER_BINF linear solve for binary fixed point

% L U binx = binb(p)

%
% Author G. Meurant
% April 2020
%

nbits = binb(1).nbits;

binb = binb(p);

% solve L y = binb
n = size(L,1);

y = fixp(zeros(n,1),nbits);
y(1) = div_binf(binb(1), L(1,1));

for k = 2:n
 s = dot_binf(L(k,1:k-1), y(1:k-1));
%  y(k) = div_binf(minus_binf(binb(k), s), L(k,k));
 y(k) = minus_binf(binb(k), s); % L(k,k) = 1
end % for k

% solve of U binx = y
binx = fixp(zeros(n,1),nbits);
binx(n) = div_binf(y(n), U(n,n));

for k = n-1:-1:1
 s = dot_binf(U(k,k+1:n), binx(k+1:n));
 binx(k) = div_binf(minus_binf(y(k), s), U(k,k));
end % for k

