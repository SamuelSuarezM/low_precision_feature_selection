function [fea] = mrmr_mid_d_fix_efi(d, f, K, T)
% function [fea] = mrmr_mid_d(d, f, K, T)
% 
% MID scheme according to MRMR
%
% By Hanchuan Peng
% April 16, 2003
%

bdisp=0;

nd = size(d,2);
nc = size(d,1);

t = zeros(1,nd);
for i=1:nd, 
   t(i) = mi_fix_efi(d(:,i), f, T);
end; 


[~, idxs] = sort(-double(t));

fea(1) = idxs(1);

KMAX = min(100,nd);

idxleft = idxs(2:KMAX);

k=1;
%{
if bdisp==1,
fprintf('k=1 cost_time=(N/A) cur_fea=%d #left_cand=%d\n', ...
      fea(k), length(idxleft));
end;
%}

mi_array = zeros(nd,K);
t_mi = zeros(1,K-1);
c_mi = zeros(1,K-1);
for k=2:K,
   ncand = length(idxleft);
   curlastfea = length(fea);
   for i=1:ncand,
      t_mi(i) = mi_fix_efi(d(:,idxleft(i)), f, T); 
      mi_array(idxleft(i),curlastfea) = getmultimi(d(:,fea(curlastfea)), d(:,idxleft(i)), T);
      c_mi(i) = mean(mi_array(idxleft(i), 1:(k-1)));
   end;

   [~, fea(k)] = max(p_binf2decm(p_minus_binfm(fix_dec2binfm(t_mi(1:ncand),T), fix_dec2binfm(c_mi(1:ncand),T))));
   
   tmpidx = fea(k); fea(k) = idxleft(tmpidx); idxleft(tmpidx) = [];
   %{
   if bdisp==1,
   fprintf('k=%d cur_fea=%d #left_cand=%d\n', ...
      k, fea(k), length(idxleft));
   end;
   %}
end;

return;

%===================================== 
function c = getmultimi(da, dt, T) 
c = zeros(1,size(da,2));
for i=1:size(da,2), 
   c(i) = mi_fix_efi(da(:,i), dt, T);
end;