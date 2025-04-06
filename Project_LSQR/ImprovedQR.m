function [Q,R,rank] = ImprovedQR(A)
m,n = size(A);
R = zeros(n,n);
Q = zeros(m,n);
rank = 0;
for j=1:n
    vector_proj = zeros(m,1);
    for i=1:rank
        vector_proj = vector_proj + R(i,j)*Q(:,i);
    end
    residual = A(:,j) - vector_proj;
    norm_residual = norm(residual);
    if norm_residual > e
        rank = rank + 1;
        R(rank,j) = norm_residual;
        Q(:,rank) = residual/norm_residual;
        for k=j+1:n
            R(rank,k) = transpose(Q(:,rank))*A(:,k);
        end
    end
    Q = Q(:,1:rank)
    R = R(1:rank,:)
end