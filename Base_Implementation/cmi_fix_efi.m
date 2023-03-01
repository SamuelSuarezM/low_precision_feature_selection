function CMI= cmi_fix_efi(  X, Y, Z, T)
% Summary 
%    Estimate conditional mutual information I(X;Y|Z) between categorical variables X,Y,Z 
%    X,Y,Z can be matrices which are converted into a joint variable before computation

epsilon = fix_dec2binf(2^(-T), T); % Valor minimo representable

if length(Z)==0 || length(unique(Z))==1
    CMI = mi_fix_efi(X,Y,T);
    return
end

[~,~,X] = unique(X,'rows');
[~,~,Y] = unique(Y,'rows');
[~,~,Z] = unique(Z,'rows');

arity_x = length(unique(X));arity_y = length(unique(Y));arity_z = length(unique(Z));

n = length(Y);
table_dim = [arity_x arity_y arity_z];
k = prod(table_dim);
%%% Find probabilities
p_xyz = fix_dec2binf3Dm(accumarray([X Y Z],1,table_dim)/n,T);
p_xyz_b = accumarray([X Y Z],1,table_dim)/n;

%p_z = squeeze(sum(sum(p_xyz,1),2));
% sum(p_xyz,1)
[na,ma,pa] = size(p_xyz);
sum1 = fix_dec2binfm(zeros(1,ma),T);
for j = 1:ma
    for i = 1:pa
        s = fix_dec2binf(0,T);
        for k = 1:na
            s = p_add_binf(s, p_xyz(k,j,i));
        end % for k
        sum1(j,i) = s;
    end % for i
end % for j

% sum(...,2)
sum2 = fix_dec2binfm(zeros(pa,1),T);
for j = 1:pa
    s = fix_dec2binf(0,T);
    for k = 1:ma
        s = p_add_binf(s, sum1(k,j));
    end % for k
    sum2(j) = s;
end % for j
%p_z = p_binf2decm(sum2);
p_z = sum2;

%p_xz = squeeze(sum(p_xyz,2));
sum2 = fix_dec2binfm(zeros(1,na),T);
for j = 1:na
    for i = 1:pa
        s = fix_dec2binf(0,T);
        for k = 1:ma
            s = p_add_binf(s, p_xyz(j,k,i));
        end % for k
        sum2(j,i) = s;
    end % for i
end % for j
%p_xz = p_binf2decm(squeeze(sum2));
p_xz = sum2;

%p_yz = squeeze(sum(p_xyz,1));
%p_yz = p_binf2decm(sum1);
p_yz = sum1;
%p_xyz = p_binf2dec3Dm(p_xyz);

CMI = fix_dec2binf(0,T);
for index_z = 1:arity_z
    %mul1 = squeeze(p_xyz(:,:,index_z))*p_z(index_z)
    [row,col] = size(p_xyz(:,:,index_z));
    mul1 = fix_dec2binfm(zeros(row,col),T);
    for i = 1:row
     for j = 1:col
      mul1(i,j) = p_mul_binf(p_z(index_z),p_xyz(i,j,index_z));
     end % for j
    end % for i
    
    %op1 = epsilon + mul1
    op1 = fix_dec2binfm(zeros(row,col),T);
    for i = 1:row
     for j = 1:col
      op1(i,j) = p_add_binf(epsilon,mul1(i,j));
     end % for j
    end % for i
    
    %mul2 = p_xz(:,index_z)* p_yz(:,index_z)'
    aux_pxz = p_xz(:,index_z); 
    aux_pyz = p_yz(:,index_z)';
    [na,ma] = size(aux_pxz);
    [nb,mb] = size(aux_pyz);

    mul2 = fix_dec2binfm(zeros(na,mb),T);

    for i = 1:na
     for j = 1:mb
      s = fix_dec2binf(0,T);

      for k = 1:ma
       s = p_add_binf(s, p_mul_binf(aux_pxz(i,k), aux_pyz(k,j)));
      end % for k

      mul2(i,j) = s;

     end % for j
    end % for i
    
    %op2 = epsilon + mul2
    op2 = fix_dec2binfm(zeros(na,mb),T);
    for i = 1:na
     for j = 1:mb
      op2(i,j) = p_add_binf(epsilon,mul2(i,j));
     end % for j
    end % for i
    
    %log_res = log(op1 ./ op2 )
    log_res = fix_dec2binfm(log(p_binf2decm(op1) ./ p_binf2decm(op2)),T);
    
    %pre_res_z = p_dot_binf(p_xyz(:,:,index_z), log_res);
    [row,col] = size(p_xyz(:,:,index_z));
    pre_res_z = fix_dec2binfm(zeros(row,col),T);
    for i = 1:row
     for j = 1:col
      pre_res_z(i,j) = p_mul_binf(p_xyz(i,j,index_z),log_res(i,j));
     end % for j
    end % for i
    
    %res_z = sum(sum(pre_res_z));
    res_z2 = sum(sum(p_binf2decm(pre_res_z)));
    
    [na,ma] = size(pre_res_z);
    aux1 = fix_dec2binfm(zeros(1,ma),T);
    for j = 1:ma
        s = fix_dec2binf(0,T);
        for k = 1:na
            s = p_add_binf(s,pre_res_z(k,j));
        end % for k
        aux1(j) = s;
    end % for j
    
    res_z = fix_dec2binf(0,T);
    for k = 1:ma
        res_z = p_add_binf(res_z, aux1(k)); % simple summation
    end
    %CMI = CMI+ res_z;
    CMI = p_add_binf(CMI, res_z);
end

CMI = p_binf2dec(CMI);
