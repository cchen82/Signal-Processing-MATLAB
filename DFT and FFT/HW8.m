%% MATLAB P1
%Part a
clc;
close all;
clear all;
j=sqrt(-1);
w = linspace(-pi,pi);
X = 0;
for k = 0:7
    X = exp(-j*w*k)*(0.7^k)+X;
end
figure(1)
subplot(2,1,1)
plot(w/pi,abs(X));
title('Magnitude Response')
xlabel('Normalized Frequency (-\pi to \pi)')
ylabel('Amplitude')
grid on;
subplot(2,1,2)
plot(w/pi,angle(X));
title('Phase Response')
xlabel('Normalized Frequency (-\pi to \pi)')
ylabel('Amplitude')
grid on;

%Part b
figure(2)
subplot(2,1,1)
n8 = linspace(0,7,8);
x = 0.7.^n8;
X8 = fftshift( fft((x),8) );
stem(abs(X8))
title('Magnitude Response (8 point DFT)')
xlabel('Discrete Frequency (k)')
ylabel('Amplitude')
grid on;
subplot(2,1,2)
stem(angle(X8))
title('Frequency Response (8 point DFT)')
xlabel('Discrete Frequency (k)')
ylabel('Amplitude')
grid on;

%Part c
figure(3)
subplot(2,1,1)
n16 = linspace(0,7,8);
x = 0.7.^n16;
X16 = fftshift( fft((x),16) );
stem(abs(X16))
title('Magnitude Response (16 point DFT)')
xlabel('Discrete Frequency (k)')
ylabel('Amplitude')
grid on;
subplot(2,1,2)
stem(angle(X16))
title('Frequency Response (16 point DFT)')
xlabel('Discrete Frequency (k)')
ylabel('Amplitude')
grid on;

%Part d
figure(4)
subplot(2,1,1)
n128 = linspace(0,7,8);
x = 0.7.^n128;
X128 = fftshift( fft((x),128) );
plot(abs(X128))
title('Magnitude Response (128 point DFT)')
xlabel('Discrete Frequency (k)')
ylabel('Amplitude')
grid on;
subplot(2,1,2)
plot(angle(X128))
title('Frequency Response (128 point DFT)')
xlabel('Discrete Frequency (k)')
ylabel('Amplitude')
grid on;
%% MATLAB P2
clear all;
clc;
close all;
%Part a
figure(5)
x = [1 1 1 1];
y = [1 1 1 1];
C = conv(x,y);
stem(C)
title('Linear Convolution of Two Sequence')
xlabel('sample point (n)')
ylabel('amplitude')
grid on
%Part b hand calculation
%Part c
figure(6)
subplot (2,1,1)
X4=fftshift(fft(x,4));
Y4=fftshift(fft(y,4));
W4=X4.*Y4;
stem(abs(ifft(W4)))
title('verification to part b')
grid on
subplot(2,1,2)
x = [1 1 1 1 0];
y = [1 1 1 1 0];
X7=fftshift(fft(x));
Y7=fftshift(fft(y));
W7=X7.*Y7;
stem(abs(ifft(W7)))
title('one zero padded')
grid on

%% MATLAB P3
clear all
clc
close all
s = load('tones.mat');
x = s.y1;
X = fftshift(fft(x,1000));
plot(abs(X))
title('Magnitude Response DFT N=1000 of tones')
xlabel('k')
ylabel('amplitude')
grid on



