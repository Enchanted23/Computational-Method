function y = language2(X,Y,x)
% ���������ղ�ֵ����ʽ��ֵ
% X,Y�ֱ�Ϊ��ֵ�ڵ�ĺ�������
% xΪ����Ĵ���ֵ����
% yΪ�����ֵ����
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

