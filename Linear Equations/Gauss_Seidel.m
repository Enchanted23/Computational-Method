function [x,k]=Gauss_Seidel(A,Y,eps,N)
% A为方程组系数矩阵，Y为常数向量项，n为方程组阶数
% x为所求得的解向量
% zeros(n,1)为迭代初值
% eps为精度指标
% N为迭代指数上界
% k为迭代次数

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
        disp('迭代次数过多');
        return
    end
end
