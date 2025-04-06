function x = Backsub(R,b)
U=R;
z=b;
n = rank(U);
x = zeros(n,1);
x(n) = z(n)/U(n,n);
for i = n-1:-1:1
    sum = 0;
    for j=i+1:n
        sum = sum + U(i,j)*x(j);
    end
    x(i) = (z(i) - sum)/U(i,i);
end