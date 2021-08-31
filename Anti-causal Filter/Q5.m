%% a. pole-zero map
z1=[1 1];
p1=[1 -0.9];
z2=[1 +1j];
z3=[1 -1j];
p2=[1 -0.6718+0.6718j];
p3=[1 -0.6718-0.6718j];
b0=1/77;
sys1=tf(z1,p1);
sys2=tf(z2,p2);
sys3=tf(z3,p3);
sys=sys1*sys2*sys3*b0;
pzmap(sys)
grid on
%% b. write a zp2tf function
%% c. use zp2tf1 function and filter
sys5=zp2tf1([-1 1j -1j],[0.9 0.6718+0.6718j 0.6718-0.6718j]);
[num,den]=tfdata(sys5);
num=cell2mat(num);
den=cell2mat(den);
imp = [1; zeros(89,1)];
imp = [zeros(10,1);imp(:)];
imp = imp';
n=linspace(-10,89,100);
y = filter(num,den,imp);
stem(n,y);
xlabel('n')
ylabel('amplitude')
title('impulse response')
%% d. use impulse response to find step response
A=y;
for x=1:100
    B=zeros(size(y));
    B(x+1:end)=y(1:end-x);
    A=A+B;
end
step1 = [1; ones(89,1)];
step1 = [zeros(10,1);step1(:)];
step1 = step1';
y1 = filter(num,den,step1);
stem(n,A);
title('step response')
xlabel('n')
ylabel('amplitude')
%% e. find an input sequence of length 3
tfunc1=zp2tf1([0.6718+0.6718j 0.6718-0.6718j],1);
[num1,den1]=tfdata(tfunc1);
num1=cell2mat(num1);
den1=cell2mat(den1);
imp = [1; zeros(89,1)];
imp = imp';
n=linspace(-10,89,100);
y2 = filter(num1,1,imp);
y2(4:100)=0;
y3 = filter(num,den,y2);
stem(n,y3)
title('input with 3 sequence')
xlabel('n')
ylabel('amplitude')

