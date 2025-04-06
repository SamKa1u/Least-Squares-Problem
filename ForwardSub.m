function z = ForwardSub(L,b)
n = rank(L);
z = zeros(n,1);
z(1) = b(1)/L(1,1);
for i=2:n
    sum = 0;
    for j=1:i-1
        sum = sum + L(i,j)*z(j);
    end
    z(i) = (b(i)-sum)/L(i,i);
end
end
