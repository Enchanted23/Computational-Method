% the main program to complete the second step of homework2
% initialization

% eΪ����ָ��
e=10^6;
% ����ϵ������ͳ���������
n=9;
A=zeros(n,n);
B=[-15;27;-23;0;-20;12;-7;7;10];
temp=[31 35 31 79 57 47 41 27 29];
temp1=[-13 -9 -10 -30 -7 -30 0 -2];
for k=2:n-1
    A(k,k)=temp(k);
    A(k,k-1)=temp1(k-1);
    A(k,k+1)=temp1(k);
end
A(1,1)=31; A(1,2)=-13; A(n,n)=29; A(n,n-1)=-2;
A(9,4)=-9; A(8,5)=-5; A(4,9)=-9; A(5,8)=-5;
A(1,6)=-10; A(2,5)=-11;
% ��ӡ���ϵ������ͳ���������
disp('A=');
disp(A);
disp('Ax=');
disp(B);
% ���ε������ַ�ʽ
X=column_main_elimination(A,B);
[X1,k1]=Jacobi(A,B,10^-6,1000000);
[X2,k2]=Gauss_Seidel(A,B,10^-6,1000000);
% ���δ�ӡ������жԱ�
disp('������Ԫ��');
disp(X);
disp('Jacobi������');
disp(X1);
disp('����������');
disp(k1);
disp('Gauss-Seidel������');
disp(X2);
disp('����������');
disp(k2);


    