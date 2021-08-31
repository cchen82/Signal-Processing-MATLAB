filterResponse21 = LPFtrunc(21);
% DTFT Magnitude response with 512 sample points 
[h1,w1] = DTFT(filterResponse21,512);
figure(1)
subplot(2,1,1)
plot(w1, 20*log10(abs(h1)));
xlabel('Frequency w');
ylabel('Magnitude H(e^jw)(dB)');
title('Magnitude response in decibel N=21');

filterResponse101 = LPFtrunc(101);
% DTFT Magnitude response with 512 sample points 
[h2,w2] = DTFT(filterResponse101,512);
subplot(2,1,2)
plot(w2, 20*log10(abs(h2)));
xlabel('Frequency w');
ylabel('Magnitude H(e^jw)(dB)');
title('Magnitude response in decibel N=101');

figure(2)
subplot(2,1,1)
plot(w1, abs(h1));
xlabel('Frequency w');
ylabel('Magnitude H(e^jw) ');
title('Magnitude response N=21');
subplot(2,1,2)
plot(w2, abs(h2));
xlabel('Frequency w');
ylabel('Magnitude H(e^jw) ');
title('Magnitude response N=101');
%% Filter the Audio
load('nspeech2.mat');
filterResponse = LPFtrunc(101); 
audio = 3 * conv(filterResponse, nspeech2); 
sound(audio);
%% (b) use firpmord and firpm to design filter
fs = 2*pi;                  % Sampling frequency
f = [1.8 2.2];    % Cutoff frequencies
a = [1 0];                  % Desired amplitudes

dev = [0.05 0.005];         %[δp δs]
[n,fo,ao,w] = firpmord(f,a,dev,fs);
b = firpm(n+1,fo,ao,w);
[h,w] = freqz(b,1,512,fs);
[h1,w1] = DTFT(b,512);
figure(1)
subplot(2,1,1)
plot(w,20*log10(abs(h)));
title('Low Pass Filter Designed with firpmord and firpm')
xlabel('frequency (w)')
ylabel('amplitude (dB)')
subplot(2,1,2)
plot(w,abs(h));
title('Low Pass Filter Designed with firpmord and firpm')
xlabel('frequency (w)')
ylabel('amplitude')
figure(2)
subplot(2,1,1)
plot(w1,20*log10(abs(h1)));
title('Low Pass Filter Designed with firpmord and firpm')
xlabel('frequency (w)')
ylabel('amplitude (dB)')
subplot(2,1,2)
plot(w1,abs(h1));
title('Low Pass Filter Designed with firpmord and firpm')
xlabel('frequency (w)')
ylabel('amplitude')

%% (c) Lowpass Butterworth Filter
close all
clear all
Fs = 44100; %Hz
fp = 2500;
fs = 4000;
G_pb_Max=40;
G_pb_Min=37;
G_sb_Max=-55;
Wp = 2*fp/Fs;
Ws = 2*fs/Fs;
Rp = G_pb_Max-G_pb_Min;
Rs = G_pb_Min-G_sb_Max;

[n,Wn] = buttord(Wp,Ws,Rp,Rs);

[z,p,k] = butter(n+2,Wn);
sos = zp2sos(z,p,k);

[h,w]=freqz(sos,6000,Fs);
subplot(3,1,1)
plot((2*pi*w/Fs),20*log10(100*abs(h)));
title(sprintf('Magnitude Response n = %d Butterworth Lowpass Filter',n+2))
xlabel('Frequency (w=0 to w=\pi)')
ylabel('Magnitude (dB)')
grid on
subplot(3,1,2)
plot((2*pi*w/Fs),20*log10(100*abs(h)));
title(sprintf('Focused Magnitude Response n = %d Butterworth Lowpass Filter',n+2))
xlabel('Frequency (w=0 to w=\pi)')
ylabel('Magnitude (dB)')
grid on
subplot(3,1,3)
grpdelay(sos,6000)
title(sprintf('Group Delay n = %d Butterworth Lowpass Filter',n+2))
grid on

figure
subplot(3,1,1)
[num,den] = zp2tf(z,p,k);
[b,a]=bilinear(num,den,1);
zplane(b,a);
grid on
subplot(3,1,2)
zplane(b,a);
grid on

[b1,a1] = sos2tf(sos);

subplot(3,1,3)
[h1,t1]=impz(sos,100);
stem(t1,h1)
title('impulse response')
xlabel('n')
ylabel('amplitude')
grid on

load projIA.
audio = 2 * conv(h1, noisy); % convoluted audio signal
audio1 = 2 * conv(h1, audio);
audio2 = 2 * conv(h1, audio1);
audio3 = 2 * conv(h1, audio2);
sound(audio3,44100);

%% (c) Chebyshev Type I Filter Design
close all
clear all
Fs = 44100; %Hz
fp = 2500;
fs = 4000;
G_pb_Max=40;
G_pb_Min=37;
G_sb_Max=-55;
Wp = 2*fp/Fs;
Ws = 2*fs/Fs;
Rp = G_pb_Max-G_pb_Min;
Rs = G_pb_Min-G_sb_Max;

[n,Wp] = cheb1ord(Wp,Ws,Rp,Rs);

[b,a] = cheby1(n,Rp,Wp);
[h,w]=freqz(b,a,6000,Fs) ;


subplot(3,1,1)
plot((2*pi*w/Fs),20*log10(100*abs(h)));
title(sprintf('Magnitude Response n = %d Chebyshev Type I Lowpass Filter',n))
xlabel('Frequency (w=0 to w=\pi)')
ylabel('Magnitude (dB)')
grid on
subplot(3,1,2)
plot((2*pi*w/Fs),20*log10(100*abs(h)));
title(sprintf('Focused Magnitude Response n = %d Chebyshev Type I Lowpass Filter',n))
xlabel('Frequency (w=0 to w=\pi)')
ylabel('Magnitude (dB)')
grid on
subplot(3,1,3)
grpdelay(b,a,6000)
title(sprintf('Group Delay n = %d Chebyshev Type I Lowpass Filter',n))
grid on

figure
subplot(2,1,1)
zplane(b,a);
grid on


subplot(2,1,2)
[h1,t1]=impz(b,a,100);
stem(t1,h1)
title('impulse response')
xlabel('n')
ylabel('amplitude')
grid on

load projIA.
audio = 4 * conv(h1, noisy); % convoluted audio signal
audio1 = 4 * conv(h1, audio);
audio2 = 4 * conv(h1, audio1);

sound(audio2,44100);
%% (c) Chebyshev Type II Filter Design
Fs = 44100; %Hz
fp = 2500;
fs = 4000;
G_pb_Max=40;
G_pb_Min=37;
G_sb_Max=-55;
Wp = 2*fp/Fs;
Ws = 2*fs/Fs;
Rp = G_pb_Max-G_pb_Min;
Rs = G_pb_Min-G_sb_Max;

[n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);

[b,a] = cheby2(n,Rs,Ws);

[h,w]=freqz(b,a,6000,Fs);

subplot(3,1,1)
plot((2*pi*w/Fs),20*log10(100*abs(h)));
title(sprintf('Magnitude Response n = %d Chebyshev Type II Lowpass Filter',n))
xlabel('Frequency (w=0 to w=\pi)')
ylabel('Magnitude (dB)')
grid on
subplot(3,1,2)
plot((2*pi*w/Fs),20*log10(100*abs(h)));
title(sprintf('Focused Magnitude Response n = %d Chebyshev Type II Lowpass Filter',n))
xlabel('Frequency (w=0 to w=\pi)')
ylabel('Magnitude (dB)')
grid on
subplot(3,1,3)
grpdelay(b,a,6000)
title(sprintf('Group Delay n = %d Chebyshev Type II Lowpass Filter',n))
grid on

figure
subplot(2,1,1)
zplane(b,a);
grid on


subplot(2,1,2)
[h1,t1]=impz(b,a,100);
stem(t1,h1)
title('impulse response')
xlabel('n')
ylabel('amplitude')
grid on

load projIA.
audio = 4 * conv(h1, noisy); % convoluted audio signal
audio1 = 4 * conv(h1, audio);

sound(audio1,44100);


%% 2 (a): MULTI-CHANNEL FIR FILTER-BANK IN ONE DIMENSION
close all
clear all
clc
%filter length
n = 100;
%filter 1 passband edge
pbe = 0.45;
% h1 is the first filter 1/2 high frequency passband
[h0,h1,g0,g1] = firpr2chfb(n-1,pbe);

% intermediate of 1/4 fill-band
h2 = conv(h0,upsample(h1,2));

% 2 low frequency bands (1/8 of full-band)
h3 = conv(upsample(h0,2),upsample(h1,4));
h3 = conv(h3,h0);
h4 = conv(upsample(h0,2),upsample(h0,4));
h4 = conv(h4,h0);


% load all frequency response into one bank
[H(1,:),f] = freqz(h1,1,6000,2);
[H(2,:),f] = freqz(h2,1,6000,2);
[H(3,:),f] = freqz(h3,1,6000,2);
[H(4,:),f] = freqz(h4,1,6000,2);



figure
for k=1:4
      plot(f,20*log10(abs(H(k,:))));
      grid on
   hold on
end
legend('high','mid','mid-low','low');
xlabel('Normalized Frequency (\omega/\pi)'),ylabel('Magnitude (dB)')
title('Magnitude Response of 4-channel Octave Band Scheme')
axis([0 1 -250 2])
%% 2 (b): Test Filter Bank
close all
n = linspace(0,100);
x = sin(8000*pi*n)+sin(1000*pi*n)+sin(4000*pi*n);

[X,f] = freqz(x,1,6000,2);
plot(f,abs(X))
grid on
title('Magnitude of Input Signal')
xlabel('Normalized Frequency (\omega/\pi)'),ylabel('Magnitude')
y1 = X'.*H(1,:);
y2 = X'.*H(2,:);
y3 = X'.*H(3,:);
y4 = X'.*H(4,:);
y=y1+y2+y3+y4;
figure
subplot(5,1,1)
plot(f,abs(y1))
grid on
title('Magnitude Response of 1st Filter From Filter Bank')
xlabel('Normalized Frequency (\omega/\pi)'),ylabel('Magnitude')
subplot(5,1,2)
plot(f,abs(y2))
grid on
title('Magnitude Response of 2nd Filter From Filter Bank')
xlabel('Normalized Frequency (\omega/\pi)'),ylabel('Magnitude')
subplot(5,1,3)
plot(f,abs(y3))
grid on
title('Magnitude Response of 3rd Filter From Filter Bank')
xlabel('Normalized Frequency (\omega/\pi)'),ylabel('Magnitude')
subplot(5,1,4)
plot(f,abs(y4))
grid on
title('Magnitude Response of 4th Filter From Filter Bank')
xlabel('Normalized Frequency (\omega/\pi)'),ylabel('Magnitude')
subplot(5,1,5)
plot(f,abs(y))
grid on
title('Magnitude Response of From Filter Bank')
xlabel('Normalized Frequency (\omega/\pi)'),ylabel('Magnitude')

%unified impulse response of filter bank
%upsample the input signal
x11=x;
x22=upsample(x,3);
x33=upsample(x,7);
x44=upsample(x,7);

% 
figure
y11= conv(x11,h1);
y11(1,200)=0;
y22= conv(x22,h2);
y22= downsample(y22,3);
y33= conv(x33,h3);
y33= downsample(y33,7);
y44= conv(x44,h4);
y44= downsample(y44,7);
yy=1/4*(0.15*y11+y22+y33+26.514*y44);
%yy = yy(1,100:end);
subplot(2,1,1)
plot(x)
grid on
title('Impulse Response of Input Signal')
xlabel('n'),ylabel('Magnitude')
subplot(2,1,2)
plot(yy)
grid on
title('Impulse Response of Reconstructed Output Signal')
xlabel('n'),ylabel('Magnitude')
axis([0 100 -4 4])

figure
[X,f] = freqz(yy,1,6000,2);
plot(f,abs(X))
grid on
title('Magnitude of Reconstructed Signal (Prescaled)')
xlabel('Normalized Frequency (\omega/\pi)'),ylabel('Magnitude')

%%  3(a): FILTER-BANK EQUALIZER
close all

low_gain=1;
mid_low_gain=1;
mid_gain=1;
high_gain=1;
[y,Fs] = audioread('Friday.mp3');


%filter length
n = 100;
%filter 1 passband edge
pbe = 0.45;
% h1 is the first filter 1/2 high frequency passband
[h0,h1,g0,g1] = firpr2chfb(n-1,pbe);

% intermediate of 1/4 fill-band
h2 = conv(h0,upsample(h1,2));

% 2 low frequency bands (1/8 of full-band)
h3 = conv(upsample(h0,2),upsample(h1,4));
h3 = conv(h3,h0);
h4 = conv(upsample(h0,2),upsample(h0,4));
h4 = conv(h4,h0);


% load all frequency response into one bank
[H(1,:),f] = freqz(h1,1,Fs,2);
[H(2,:),f] = freqz(h2,1,Fs,2);
[H(3,:),f] = freqz(h3,1,Fs,2);
[H(4,:),f] = freqz(h4,1,Fs,2);

figure
[X,f] = freqz(y(:,1),1,6000,2);
plot(f,abs(X))
grid on
title('Magnitude of Input Song')
xlabel('Normalized Frequency (\omega/\pi)'),ylabel('Magnitude')
figure
subplot(2,1,1)
plot(y)
grid on
title('Impulse Response of Input Voice')
xlabel('n'),ylabel('Magnitude')

%sound(y,Fs);
x11=y(:,1);
x22=upsample(y(:,1),3);
x33=upsample(y(:,1),7);
x44=upsample(y(:,1),7);


y11= conv(x11,high_gain*h1);
y11(2884180,1)=0;
y22= conv(x22,mid_gain*h2);
y22= downsample(y22,3);
y33= conv(x33,mid_low_gain*h3);
y33= downsample(y33,7);
y44= conv(x44,low_gain*h4);
y44= downsample(y44,7);
yy=1/9*1/4*(0.15*y11+y22+y33+26.514*y44);
subplot(2,1,2)
%yy=yy(3:103);
plot(yy)
grid on
title('Impulse Response of Reconstructed Output Voice')
xlabel('n'),ylabel('Magnitude')
%axis([0 2.5e+5 -0.06 0.06])
sound(yy,Fs);


