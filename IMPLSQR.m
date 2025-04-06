function xls = IMPLSQR(A,b)
[~ , n] = size(A);
[Q,R,rank] = ImprovedQR(A);
b = transpose(Q)*b;
if rank == n
    xls=Backsub(R,b);
else 
    [Q1,R1,~] = ImprovedQR(transpose(R));
    z = ForwardSub(transpose(R1),b);
    xls = Q1*z
end
end
