function result = homework1(n)
% X0Ϊ�Ⱦ�ָ�ʱ�ĵ�ĺ�����������xi=-1+2*i/n
% X1Ϊ���ýڵ�ΪChebyshev��ʱ�ĵ�ĺ�����������xi=cos((2*i+1)*pi/(2*(n+1))),i=0,1,....,n
% Y0,Y1�ֱ�Ϊ����ȡ�㷽ʽ�µ�����������������Ϊf(x)=1/(1+x^2)
% ZΪ����������õĵ㣬Z(i)=-1+i/(n+1)
% Ea,Eb�ֱ�Ϊ���ַָ��µ��������
% L0a,L0b�Լ�L1a,L1bΪppt��Ҫ����ĸ������������ֵ
% ��ͼʱ�������ⵥ��ȡ�ĵ㣬mȡ2k+1���㣬k����ȡ400

% n��Ϊ�����ӵ�������
% eg������ʱ�û�homework1(80);
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


%��ʼ��ͼ,��Ϊ�Ⱦ�ָ��ͼ
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
title(' ע������Ϊԭ����f(x),����Ϊ�ڵȾ�ָ��µ�language��ֵ����ʽ');
xlabel('���� X');
ylabel('���� Y1 & Y2');

figure(2)
plot(x,y1,'-or',x,y3,'-*b');
axis([-1 1 -2 2]);
grid on;
title(' ע������Ϊԭ����f(x),����Ϊ�ڵȾ�ָ��µ�newton��ֵ����ʽ');
xlabel('���� X');
ylabel('���� Y1 & Y2');

%��Ϊ����ѩ����ͼ
y4=language2(X1,Y1,x);
y5=newton2(X1,Y1,x);

figure(3)
plot(x,y1,'-or',x,y4,'-*b');
axis([-1 1 -2 2]);
grid on;
title(' ע������Ϊԭ����f(x),����Ϊ��Cheybyshev��ָ��µ�language��ֵ����ʽ');
xlabel('���� X');
ylabel('���� Y1 & Y2');

figure(4)
plot(x,y1,'-or',x,y5,'-*b');
axis([-1 1 -2 2]);
grid on;
title('  ע������Ϊԭ����f(x),����Ϊ��Cheybyshev��ָ��µ�newton��ֵ����ʽ');
xlabel('���� X');
ylabel('���� Y1 & Y2');

end
