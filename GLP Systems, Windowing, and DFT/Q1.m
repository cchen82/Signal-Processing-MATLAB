%% Matlab Problem 1 rectwin
clear all
L=22;
%win = rectwin(L+1);
%win = bartlett(L+1);
%win = hann(L+1);
%win = hamming(L+1);
win = blackman(L+1);
n = -L/2:L/2;
w0 = 0.3*pi; % cut-off frequency
hfilt = (w0/ pi) * sinc (w0*n/pi); % impulse response of the FIR filter
hd = hfilt.*win'; % windowed response
 
w = linspace(-pi,pi,512);
figure(1)
impz(hd);
xlabel('Frequency w');
ylabel('H(e^j^w)');
title('Impulse response of FIR filter with blackman window');
%Frequency Response
h = fftshift(fft(hd,length(w)));
grid on
 
figure(2)
freqz(hd); % magnitude and phase plots
title('FIR filter response with blackman window');
 
figure(3)
plot(w/pi, 20*log10(abs(h)));
xlabel('Normalized Frequency (w/\pi)');
ylabel('Magnitude (dB)');
title('Magnitude response of the rectwin filter');
grid on
 
%Ideal filter response
hideal=zeros(1,length(w));
for i=1:length(w)
if(abs(w(i))<w0)
hideal(i)=1;
end
end
%Squared Error
error = 0;
for i = 1:length(w)
error = error + abs(power(h(i) - hideal(i),2));
end
error/length(w)

%% bartlett

%% hann

%% hamming
%% blackman

