function y = newton2(X,Y,x)
% 求牛顿插值多项式的值
% X,Y分别为插值节点的横纵坐标
% x为输入的待求值向量
% y为求出的值向量

n=length(X);
m=length(x);
y=zeros(1,n);
for t=1:m
    A=zeros(n,n);
    A(:,1)=Y';
    for j=2:n
        for i=j:n
            A(i,j)=(A(i,j-1)-A(i-1,j-1))/(X(i)-X(i-j+1)); %依次计算j-1阶差商
        end                
    end
    s=0;
    d=1;
    for k=1:n
        s=s+A(k,k)*d;
        d=d*(x(t)-X(k));
    end
    y(t)=s;
end
    
end

