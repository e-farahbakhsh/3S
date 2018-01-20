[m,n] = size(A);
j = 1;

for i = 3:n
    Threshold(j,:) = prctile(A(:,i),[50 84 90 95 97.5 99]);
    j = j+1;
end

[m1,n1] = size(Threshold);
Basin = A(1,1);
j = 1;
k = 0;

for i = 1:m
    if A(i,1) == Basin(j,1)
        k = k+1;
        Basin(j,2) = k;
    else
        k = 1;
        j = j+1;
        Basin(j,1) = A(i,1);
        Basin(j,2) = k;
    end
end

[m2,n2] = size(Basin);
k = 1;

for i = 1:m2
    for j = 3:n
    Final.Basin{i,j-2} = A(k:k+Basin(i,2)-1,j);
    end
    k = sum(Basin(1:i,2))+1;
end

Final.Class = cell(m2,n-2);

for i = 1:m2
    for j = 1:n-2
        Final.Class{i,j} = cell(1,n1+1);
    end
end

for i = 1:m2
    for j = 1:n-2
        [m3,n3] = size(Final.Basin{i,j});
        for k = 1:m3
            if Final.Basin{i,j}(k,1) < Threshold(j,1)
                if isempty(Final.Class{i,j}{1,1})
                    Final.Class{i,j}{1,1}(1,1) = Final.Basin{i,j}(k,1);
                else
                    [m4,n4] = size(Final.Class{i,j}{1,1});
                    Final.Class{i,j}{1,1}(m4+1,1) = Final.Basin{i,j}(k,1);
                end
            elseif Final.Basin{i,j}(k,1) >= Threshold(j,n1)
                if isempty(Final.Class{i,j}{1,n1})
                    Final.Class{i,j}{1,n1}(1,1) = Final.Basin{i,j}(k,1);
                else
                    [m4,n4] = size(Final.Class{i,j}{1,n1});
                    Final.Class{i,j}{1,n1}(m4+1,1) = Final.Basin{i,j}(k,1);
                end
            else
                for l = 1:n1-1
                    if Final.Basin{i,j}(k,1) >= Threshold(j,l) && Final.Basin{i,j}(k,1) < Threshold(j,l+1)
                        if isempty(Final.Class{i,j}{1,l+1})
                            Final.Class{i,j}{1,l+1} = Final.Basin{i,j}(k,1);
                        else
                            [m4,n4] = size(Final.Class{i,j}{1,l+1});
                            Final.Class{i,j}{1,l+1}(m4+1,1) = Final.Basin{i,j}(k,1);
                        end
                    else
                        continue
                    end
                end
            end
        end
    end
end

for i = 1:m2
    for j = 1:n-2
        for k = 1:n1+1
            [m5,n5] = size(Final.Class{i,j}{1,k});
            Final.Number{i,j}(1,k) = m5;
            Final.Median{i,j}(1,k) = median(Final.Class{i,j}{1,k});
            if isnan(Final.Median{i,j}(1,k))
                Final.Median{i,j}(1,k) = 0;
            end
        end
    end
end

for i = 1:m2
    for j = 1:n-2
        for k = 1:n1+1
            Final.Score{i,j}(1,k) = k.*Final.Median{i,j}(1,k).*(Final.Number{i,j}(1,k)./Basin(i,2)).*100;
        end
    end
end
%% Logistic function
for i = 1:m2
    for j = 1:n-2
        Basin(i,j+2) = sum(Final.Score{i,j});
    end
end

for i = 1:n-2
    ss(1,i) = (2.*log(99))./(max(Basin(:,i+2))-min(Basin(:,i+2)));
    ii(1,i) = (max(Basin(:,i+2))+min(Basin(:,i+2)))./2;
end

for i = 1:m2
    for j = 1:n-2
        for k = 1:n1+1
            Basin(i,j+n) = 1./(1+(exp((-1.*ss(1,j)).*(Basin(i,j+2)-ii(1,j)))));
        end
    end
end