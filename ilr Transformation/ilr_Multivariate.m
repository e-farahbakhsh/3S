[m,n] = size(A);

for j = 1:n-1
    for i = 1:m
        B(i,j) = sqrt((n-j)/(n-j+1)).*log(A(i,j)/nthroot(prod(A(i,j+1:n)),n-j));
    end
end