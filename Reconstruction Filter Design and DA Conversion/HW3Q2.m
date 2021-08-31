close all
clc

%% Q2 Matlab problem 2
%Part (a)
%choose f0 (signal frequency) less than 1/5 fsim (simulation frequency)
fsim=80*1e+3;
f0=fsim/1000;
%phase to be random
phi=0;
%choose a T so we have 900-1000 samples over fsim
T=950*(1/fsim);
t=linspace(0,T,950);
x=cos(2*pi.*f0.*t+phi);
figure
plot(t*1e+3,x);
xlabel('t(ms)');
ylabel('x(t)');
title('simulated sinusoid analog signal');
grid on

%Part (b)
%use fmagplot to plot the FT of signal in (a)
figure
fmagplot(x,(1/fsim));

%Part (c)
%A/D operation
figure
fs=8*1e+3;
L=fsim/fs;
Ts=1/fs;
ts=downsample(t,L);
xs=downsample(x,L);
stem(ts*1e+3,xs);
xlabel('t(ms)');
ylabel('x(t)');
title('DT signal when fs=8kHz');
grid on

%Part (d)
n=ts/Ts; %A/D x-axis scaling from time domain to domainless position
w=linspace(-pi,pi,1000);
X=DTFT(xs,ts/Ts,w);


%% Q2 Matlab problem 3
close all
figure
fcut=2*(fs/2)/fsim;
[b,a]=cheby2(9,60,fcut);
freqz(b,a);
A=n_zero_insertion((fsim/fs),xs);
dataIn = A;
dataOut = filter(b,a,dataIn);
figure
plot(t*1e+3,dataOut);
xlabel('t(ms)');
ylabel('x(t)');
title('reconstructed sinusoid analog signal');
grid on
figure
fmagplot(dataOut,(1/fcut));























