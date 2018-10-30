% the main program to complete the second step of homework2
% initialization

% e为精度指标
e=10^6;
% 构造系数矩阵和常数向量项
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
% 打印输出系数矩阵和常数向量项
disp('A=');
disp(A);
disp('Ax=');
disp(B);
% 依次调用三种方式
X=column_main_elimination(A,B);
[X1,k1]=Jacobi(A,B,10^-6,1000000);
[X2,k2]=Gauss_Seidel(A,B,10^-6,1000000);
% 依次打印结果进行对比
disp('列主消元法');
disp(X);
disp('Jacobi迭代：');
disp(X1);
disp('迭代次数：');
disp(k1);
disp('Gauss-Seidel迭代：');
disp(X2);
disp('迭代次数：');
disp(k2);


    