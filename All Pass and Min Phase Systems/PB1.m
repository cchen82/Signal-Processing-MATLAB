%% Make magnitude and phase response with 512 frequency samples
b=[1 0.5];
a=[1 -1.8*cos(pi/16) 0.81];
N=512; % # of frequency response samples
[h,w] = freqz(b,a,'whole',N);

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
%% Redo above with upper half of the unit circle
figure
b=[1 0.5];
a=[1 -1.8*cos(pi/16) 0.81];
N=512; % # of frequency response samples
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
%% (d) Redo a-c with new difference equation
b=[0.16 -0.48 0.48 -0.16];
a=[1 0.13 0.52 0.3];
N=512; % # of frequency response samples
[h,w] = freqz(b,a,'whole',N);

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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
N=512; % # of frequency response samples
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
%% (e) Redo a-c with new difference equation
b=[0.634 0 -0.634];
a=[1 0 -0.268];
N=512; % # of frequency response samples
[h,w] = freqz(b,a,'whole',N);

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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
N=512; % # of frequency response samples
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