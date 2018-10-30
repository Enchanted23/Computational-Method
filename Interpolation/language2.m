function y = language2(X,Y,x)
% 求拉格朗日插值多项式的值
% X,Y分别为插值节点的横纵坐标
% x为输入的待求值向量
% y为求出的值向量
m=length(x);
n=length(X);
y=zeros(1,m);

for k=1:m
    s=0;
    for i=1:n
        z=1;
        for j=1:n
            if j ~= i
            z=z*(x(k)-X(j))/(X(i)-X(j));
            end
        end
        s=s+z*Y(i);
    end
    y(k)=s;
end

end

