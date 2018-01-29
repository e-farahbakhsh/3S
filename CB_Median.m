[m,n] = size(A);
CB_Median_Mat = A(1,1);
j = 1;
k = 0;

for i = 1:m
    if A(i,1) == CB_Median_Mat(j,1)
        k = k+1;
        CB_Median_Mat(j,2) = k;
    else
        k = 1;
        j = j+1;
        CB_Median_Mat(j,1) = A(i,1);
        CB_Median_Mat(j,2) = k;
    end
end

[m2,n2] = size(CB_Median_Mat);
k = 1;

for i = 1:m2
    for j = 3:n
    Final.Basin{i,j-2} = A(k:k+CB_Median_Mat(i,2)-1,j);
    end
    k = sum(CB_Median_Mat(1:i,2))+1;
end

for i = 1:m2
    for j = 1:n-2
        Final.Max(i,j) = max(Final.Basin{i,j});
        Final.Min(i,j) = min(Final.Basin{i,j});
    end
end

for i = 1:m2
    for j = 1:n-2
        Final.ss(i,j) = (2.*log(99))./((Final.Max(i,j))-Final.Min(i,j));
        Final.ii(i,j) = (Final.Max(i,j)+Final.Min(i,j))./2;
    end
end

for i = 1:n-2
    ssMedian(1,i) = median(Final.ss(:,i));
    iiMedian(1,i) = median(Final.ii(:,i));
end

for i = 1:m2
    for j = 1:n-2
        [m3,n3] = size(Final.Basin{i,j});
        for k = 1:m3
            if ~isinf(Final.ss(i,j))
                Final.Transformed{i,j}(k,1) = 1./(1+(exp((-1.*Final.ss(i,j)).*(Final.Basin{i,j}(k,1)-Final.ii(i,j)))));
            else
                Final.Transformed{i,j}(k,1) = 1./(1+(exp((-1.*ssMedian(1,j)).*(Final.Basin{i,j}(k,1)-iiMedian(1,j)))));
            end
        end
    end
end

for i = 1:m2
    for j = 1:n-2
        CB_Median_Mat(i,j+2) = median(Final.Transformed{i,j});
    end
end