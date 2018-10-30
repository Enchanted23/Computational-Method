function [x,k]=Jacobi(A,Y,eps,N)
% AΪ������ϵ������YΪ���������nΪ���������
% xΪ����õĽ�����
% zeros(n,1)Ϊ������ֵ
% epsΪ����ָ��
% NΪ����ָ���Ͻ�
% kΪ��������

% initialization
n=length(Y);
D=diag(diag(A));
temp=ones(n,1);
x=zeros(n,1);
B=inv(D)*(D-A);
g=inv(D)*Y;

% begin the iteration

k=0;
while max(abs(x-temp))>eps
    temp=x;
    k=k+1;
    x=B*x+g;
    if k>N
        disp('������������');
        return
    end
end
