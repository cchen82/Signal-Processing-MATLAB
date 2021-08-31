clear all 

clc
n = linspace(0,100,1000);
d=sin(n);
variation=linspace(1,20,length(n));
figure(1)
subplot(2,1,1)
plot(n,d)
title('desired sequence')
xlabel('n')
ylabel('amplitude')
grid on
u = 0.000005;
r = 0.9;
a = zeros(1,1000);
e = zeros(1,1000);
% noise = zeros(1,1000);
noise1 = 20*sin(20*n);
noise2 = 40*sin(30*n);
y=zeros(1,length(n));
%generate noise
% noise=10*sin(n.*variation);
x = d+noise1+noise2;

subplot(2,1,2)
plot(n,x)
title('input sequence with noise')
xlabel('n')
ylabel('amplitude')
grid on


for N = 3:length(x)-1
   y(N) = x(N)+a(N)*x(N-1)+x(N-2)-r*a(N)*y(N-1)-(r^2)*y(N-2);
     a(N+1) = a(N)-u*y(N)*x(N-1);
    if a(N+1)>=2 || a(N+1)<=-2
        a(N)=0;
        a(N+1)=0;
    end
    y(N) = x(N)+a(N)*x(N-1)+x(N-2)-r*a(N)*y(N-1)-(r^2)*y(N-2);
end

figure(1)
subplot(2,1,1)
plot(n,a)
title('first convergence plot')
xlabel('n')
ylabel('amplitude')
grid on
subplot(2,1,2)
plot(n,2.*y.*x)
title('gradient plot')
xlabel('n')
ylabel('amplitude')
grid on

u = 0.00008;
r = 0.95;
b=a;
new_x=y;
for N = 3:length(new_x)-1
   y(N) = new_x(N)+b(N)*new_x(N-1)+new_x(N-2)-r*b(N)*y(N-1)-(r^2)*y(N-2);
     b(N+1) = b(N)-u*y(N)*new_x(N-1);
    if b(N+1)>=2 || b(N+1)<=-2
        b(N)=0;
        b(N+1)=0;
    end
    y(N) = new_x(N)+b(N)*new_x(N-1)+new_x(N-2)-r*b(N)*y(N-1)-(r^2)*y(N-2);
end

figure(2)
subplot(2,1,1)
plot(n,b)
title('second convergence plot')
xlabel('n')
ylabel('amplitude')
grid on
subplot(2,1,2)
plot(n,2.*y.*x)
title('gradient plot')
xlabel('n')
ylabel('amplitude')
grid on

figure(3)
subplot (2,1,1)
plot(n,y)
title('output sequence after adaptive filter')
xlabel('n')
ylabel('amplitude')
grid on
subplot (2,1,2)
plot(n,y-d)
title('difference between desired sequence and output sequence')
xlabel('n')
ylabel('amplitude')
grid on