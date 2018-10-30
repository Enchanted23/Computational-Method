function [X] = column_main_elimination(A,B)
% A为方程组系数矩阵，B为常数向量项，n为方程组阶数
% X为所求得的解向量

n=length(B);
X(1:n,1)=0;

% elimilation
for k=1:n-1
    ak=max(abs(A(k:n,k)));
    index=find(abs(A(:,k))==ak);
    
    % perform the exchange
    temp=A(k,:);
    A(k,:)=A(index(1),:);
    A(index(1),:)=temp;
    temp_b=B(k);
    B(k)=B(index(1));
    B(index(1))=temp_b;
    
    % clear up column elements
    if A(k,k)~=0;
        for i=k+1:n
            if A(i,k)~=0
                m=A(i,k)/A(k,k);
                A(i,k:n)=A(i,k:n)-A(k,k:n).*m;
                B(i)=B(i)-B(k)*m;
            end
        end
    end
end

% back substitution
for k=n:-1:1
    X(k)=B(k)/A(k,k);
    for i=k-1:-1:1
        B(i)=B(i)-X(k)*A(i,k);
    end
end


    
    