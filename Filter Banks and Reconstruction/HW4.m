%% Problem 1.a
syms A w phi
[SolA,Solphi,Solw]=solve(A*cos(w*0+phi)==2,A*cos(w*1+phi)==1,A*cos(w*2+phi)==-1);
t=linspace(0,2,2/0.01);
plot(t,-2*cos(pi/3.*t+pi));

hold on
plot(t,-2*cos(pi*5/3.*t+pi));
grid on
legend('-2*cos(pi.*t+pi/3)','-2*cos(pi.*t+pi*5/3)')
xlabel('time (s)')
ylabel('amplitude')
title('continuous time graphing')
hold off

%% Problem 1.b.i
t=linspace(0,2,2/0.01);
line(t,-2*cos(pi*5/3.*t+pi));
hold on
t=[0 1 2];
x=[2 1 -1];
stem(t,x,'o');
line(t,x);
grid on
legend('samples solved in (a)','linear interpolation of given samples')
xlabel('time (s)')
ylabel('amplitude')
title('linear interpolation')
hold off
%% Problem 1.b.ii


x=[2 0 0 0 0 1 0 0 0 0 -1];
impulse=[0 0.2 0.4 0.6 0.8 1.0 0.8 0.6 0.4 0.2 0];
h=conv(x,impulse);
tx=linspace(0,10,11);
subplot(4,1,1)
stem(tx,x);
title('upsampled samples')
xlabel('n')
ylabel('amplitude')
grid on

subplot(4,1,2)
impt=linspace(-5,5,11);
stem(impt,impulse);
title('triangle impulses')
xlabel('n')
ylabel('amplitude')
grid on

subplot(4,1,3)
convt=linspace(-5,15,21);
stem(convt,h);
title('convolution of triangle and samples')
xlabel('n')
ylabel('amplitude')
grid on

subplot(4,1,4)
h=downsample(h,5);
convtt=linspace(-1,3,5);
stem(convtt,h);
line(convtt(2:4),h(2:4));
title('downsampled convolution of triangle and samples')
xlabel('n')
ylabel('amplitude')
grid on
%% Problem 1.b.iii
t=[0 1 2];
x=[2 1 -1];

scatter(t,x)
hold on

p=polyfit(t,x,2);
t1=linspace(-5,5);
x1=polyval(p,t1);
plot(t1,x1);

hold off

title('using polyfit and polyval to predict')
legend('given three samples','polyfit curve')
xlabel('t')
ylabel('amplitude')
grid on


%% Problem 1.c.i
t=[0 1 2 3 4 5 6 7 8 9 10];
y=sinc_interp(t,[0 0 0 0 0 1 0 0 0 0 0])

t=t-mean(t);
plot(t,y)
title('interpolation of single-point')
xlabel('t')
ylabel('amplitude')
grid on

%% Problem 1.c.ii
t=[0 1 2 3 4 5 6 7 8 9 10];
y=sinc_interp(t,[0 0 0 0 0 2 1 -1 0 0 0])

t=t-mean(t);
plot(t,y)
title('interpolation of three points')
xlabel('t')
ylabel('amplitude')
grid on
















