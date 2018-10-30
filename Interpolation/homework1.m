function result = homework1(n)
% X0为等距分割时的点的横坐标向量，xi=-1+2*i/n
% X1为采用节点为Chebyshev点时的点的横坐标向量，xi=cos((2*i+1)*pi/(2*(n+1))),i=0,1,....,n
% Y0,Y1分别为两种取点方式下的纵坐标向量，函数为f(x)=1/(1+x^2)
% Z为计算误差所用的点，Z(i)=-1+i/(n+1)
% Ea,Eb分别为两种分割下的误差向量
% L0a,L0b以及L1a,L1b为ppt上要求的四个用来填误差表的值
% 绘图时我是另外单独取的点，m取2k+1个点，k这里取400

% n作为参数从电脑输入
% eg：输入时敲击homework1(80);
X0=zeros(1,n+1);
X1=zeros(1,n+1);
Y0=zeros(1,n+1);
Y1=zeros(1,n+1);
Z=zeros(1,n+1);
Zy=zeros(1,n+1);
Ea=zeros(1,n+1);
Eb=zeros(1,n+1);
for k=0:n
    X0(k+1)=-1+2*k/n;
    Y0(k+1)=1/(1+(X0(k+1))^2);
    temp=(2*k+1)*pi/(2*(n+1));
    X1(k+1)=cos(temp);
    Y1(k+1)=1/(1+(X1(k+1))^2);
    Z(k+1)=-1+k/(n+1);
    Zy(k+1)=1/(1+(Z(k+1))^2);
end

ya=language2(X0,Y0,Z);
yb=newton2(X0,Y0,Z);
%disp(vpa(La,5));
%disp(vpa(Lb,5));
for i=1:n+1
    Ea(i)=Zy(i)-ya(i);
    Eb(i)=Zy(i)-yb(i);
end
L0a=max(abs(Ea));
L0b=max(abs(Eb));
L1a=0;
L1b=0;
for i=1:n+1
    L1a=L1a+abs(Ea(i));
    L1b=L1b+abs(Eb(i));
end
L1a=L1a/(n+1);
L1b=L1b/(n+1);
disp(L0a);
disp(L1a);
disp(L0b);
disp(L1b);

ya=language2(X1,Y1,Z);
yb=newton2(X1,Y1,Z);
%disp(vpa(La,5));
%disp(vpa(Lb,5));
for i=1:n+1
    Ea(i)=Zy(i)-ya(i);
    Eb(i)=Zy(i)-yb(i);
end
L0a=max(abs(Ea));
L0b=max(abs(Eb));
L1a=0;
L1b=0;
for i=1:n+1
    L1a=L1a+abs(Ea(i));
    L1b=L1b+abs(Eb(i));
end
L1a=L1a/(n+1);
L1b=L1b/(n+1);
disp(L0a);
disp(L1a);
disp(L0b);
disp(L1b);

%{
for i=1:n+1disp(Ea(i));
    disp(Eb(i));
end
%}


%开始作图,此为等距分割的图
k=400;
k1=2*k+1;
x=-1:1/k:1;
y1=zeros(1,k1);
for i=1:k1
    y1(i)=1/(1+x(i)^2);
end

y2=language2(X0,Y0,x);
y3=newton2(X0,Y0,x);

figure(1)
plot(x,y1,'-or',x,y2,'-*b');
axis([-1 1 -2 2]);
grid on;
title(' 注：红线为原函数f(x),蓝线为在等距分割下的language插值多项式');
xlabel('变量 X');
ylabel('变量 Y1 & Y2');

figure(2)
plot(x,y1,'-or',x,y3,'-*b');
axis([-1 1 -2 2]);
grid on;
title(' 注：红线为原函数f(x),蓝线为在等距分割下的newton插值多项式');
xlabel('变量 X');
ylabel('变量 Y1 & Y2');

%此为车比雪夫点的图
y4=language2(X1,Y1,x);
y5=newton2(X1,Y1,x);

figure(3)
plot(x,y1,'-or',x,y4,'-*b');
axis([-1 1 -2 2]);
grid on;
title(' 注：红线为原函数f(x),蓝线为在Cheybyshev点分割下的language插值多项式');
xlabel('变量 X');
ylabel('变量 Y1 & Y2');

figure(4)
plot(x,y1,'-or',x,y5,'-*b');
axis([-1 1 -2 2]);
grid on;
title('  注：红线为原函数f(x),蓝线为在Cheybyshev点分割下的newton插值多项式');
xlabel('变量 X');
ylabel('变量 Y1 & Y2');

end
