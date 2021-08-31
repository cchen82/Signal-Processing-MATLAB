%% Part A: Adaptive Notch Filter (a)
clear all 
close all
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
u = 0.0002;
r = 0.88;
a = zeros(1,1000);
e = zeros(1,1000);
% noise = zeros(1,1000);
noise = 20*sin(20*n);

y=zeros(1,length(n));
%generate noise
% noise=10*sin(n.*variation);
x = d+noise;



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


figure(2)
subplot(2,1,1)
plot(n,a)
title('convergence plot')
xlabel('n')
ylabel('amplitude')
grid on
subplot(2,1,2)
plot(2.*y.*x)
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


figure(4)
hold on
freqz(y)
hold on
freqz(d)
hold on
freqz(x)
legend('freqz of output','freqz of desired','freqz of input with noise')
lines = findall(gcf,'type','line');
set(lines(1),'Color','red')
set(lines(2),'Color','green')
title('frequency response')
hold off
grid on

%% Part A (2) slow changing frequency noise
clear all 
close all
clc
n = linspace(0,100,1000);
d=sin(n);
variation=linspace(1,10,length(n));
figure(1)
subplot(2,1,1)
plot(n,d)
title('desired sequence')
xlabel('n')
ylabel('amplitude')
grid on
u = 0.005;
r = 0.82;
a = zeros(1,1000);
e = zeros(1,1000);



y=zeros(1,length(n));
%generate noise
noise=10*sin(n.*variation);
x = d+noise;



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


figure(2)
subplot(2,1,1)
plot(n,a)
title('convergence plot')
xlabel('n')
ylabel('amplitude')
grid on
subplot(2,1,2)
plot(2.*y.*x)
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


figure(4)
hold on
freqz(y)
hold on
freqz(d)
hold on
freqz(x)
legend('freqz of output','freqz of desired','freqz of input with noise')
lines = findall(gcf,'type','line');
set(lines(1),'Color','red')
set(lines(2),'Color','green')
title('frequency response')
hold off
grid on

