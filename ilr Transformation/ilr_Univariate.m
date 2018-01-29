[m,n] = size(A);
B = A;

for j = 1:n
    A(:,1) = B(:,j);
    A(:,j) = B(:,1);
    for i = 1:m
        C(i,j) = sqrt((n-1)/n).*log(A(i,1)/nthroot(prod(A(i,2:n)),n-1));
    end
end