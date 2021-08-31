%% (b) frequency response w0=2pi/5
j=sqrt(-1);
w0=2*pi/5;
C1=exp(j*w0);
C2=exp(j*-w0);
p =[0.9*C1 0.9*C2];
z =[C1 C2];
tfunc1=zp2tf1(z,p);
[b,a]=tfdata(tfunc1);
b=cell2mat(b);
a=cell2mat(a);

N =1/(1e-3);
[h,w] = freqz(b,a,N);

subplot(2,1,1)
plot(w/pi,20*log10(abs(h)))

xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
title('Magnitude Response')

subplot(2,1,2)
plot(w/pi,angle(h))
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Phase (degree)')
title('Phase Response')
%% (d) Suppress 60 Hz frequency Component
j=sqrt(-1);
%fs=1000 Hz, fc=60 Hz
w0=60/(1000)*2*pi;
%w0=2*pi*1000;
C1=exp(j*w0);
C2=exp(j*-w0);
p =[0.9*C1 0.9*C2];
z =[C1 C2];
tfunc1=zp2tf1(z,p);
[b,a]=tfdata(tfunc1);
b=cell2mat(b);
a=cell2mat(a);

N =1/(1e-3);
[h,w] = freqz(b,a,N);

subplot(2,1,1)
plot(w/pi,20*log10(abs(h)))

xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
title('Magnitude Response')

subplot(2,1,2)
plot(w/pi,angle(h))
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Phase (degree)')
title('Phase Response')

%% (e) Generate 150 samples of 60 Hz sine wave sampled at fs=1kHz
%Filter Definition
j=sqrt(-1);
%w0=2*60*pi;
C1=exp(j*w0);
C2=exp(j*-w0);
p =[0.9*C1 0.9*C2];
z =[C1 C2];
tfunc1=zp2tf1(z,p);
[b,a]=tfdata(tfunc1);
b=cell2mat(b);
a=cell2mat(a);

%%Time specifications:
Fs = 1000;                   % samples per second
dt = 1/Fs;                   % seconds per sample
StopTime = 150*dt;             % seconds
t = (0:dt:StopTime-dt)';     % seconds
%%Sine wave:
Fc = 60;                     % hertz
x = cos(2*pi*Fc*t);
   
n = linspace(1,150,150);
y=filter(b,a,x);
subplot(2,1,1)
stem(n,x);
title('input signal')
xlabel('n')
ylabel('magnitude')
subplot(2,1,2)
stem(n,y);
title('output signal')
xlabel('n')
ylabel('magnitude')

%% (f) DTFT of filtered signal
%Filter Definition
j=sqrt(-1);
%w0=2*60*pi;
C1=exp(j*w0);
C2=exp(j*-w0);
p =[0.9*C1 0.9*C2];
z =[C1 C2];
tfunc1=zp2tf1(z,p);
[b,a]=tfdata(tfunc1);
b=cell2mat(b);
a=cell2mat(a);

%%Time specifications:
Fs = 1000;                   % samples per second
dt = 1/Fs;                   % seconds per sample
StopTime = 150*dt;             % seconds
t = (0:dt:StopTime-dt)';     % seconds
%%Sine wave:
Fc = 60;                     % hertz
x = cos(2*pi*Fc*t);
   
n = linspace(1,150,150);
y=filter(b,a,x);
subplot(2,1,1)
plot(t,x);
title('input signal')
xlabel('time(s)')
ylabel('magnitude')
subplot(2,1,2)
plot(t,y);
title('onput signal')
xlabel('time(s)')
ylabel('magnitude')
