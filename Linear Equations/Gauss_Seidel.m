function [x,k]=Gauss_Seidel(A,Y,eps,N)
% AΪ������ϵ������YΪ���������nΪ���������
% xΪ����õĽ�����
% zeros(n,1)Ϊ������ֵ
% epsΪ����ָ��
% NΪ����ָ���Ͻ�
% kΪ��������

% initialization
n=length(Y);
D=diag(diag(A));
L=tril(A)-D;
U=triu(A)-D;
temp=ones(n,1);
x=zeros(n,1);
S=-inv(D+L)*U;
f=inv(D+L)*Y;

% begin the iteration

k=0;
while max(abs(x-temp))>eps
    temp=x;
    k=k+1;
    x=S*x+f;
    if k>N
        disp('������������');
        return
    end
end
