%% a impulse response of time reverse
b=1;
a=[1 -0.95];
imp = [1; zeros(63,1)];
imp = [zeros(64,1);imp(:)];
imp = imp';
n=linspace(-64,63,128);
y = filter(b,a,imp);
y = fliplr(y);
plot(n,y);
xlabel('n')
ylabel('amplitude')
title('impulse response of H_c(1/z) (when z>0.95)')
%% b frequency response magnitude and group delay
figure
Y = fft(y, 128);
[gd,w] = gdel(y,n,128);
subplot(3,1,1)
plot(w,abs(Y))
title('magnitude of H_c[z] (when z>0.95)')
xlabel('w (-\pi to \pi)')
ylabel('amplitude')

subplot(3,1,2)
plot(w,angle(Y))
title('phase of H_c[z] (when z>0.95)')
xlabel('w (-\pi to \pi)')
ylabel('amplitude')

subplot(3,1,3)
plot(w,gd)
title('group delay of H_c[z] (when z>0.95)')
xlabel('w (-\pi to \pi)')
ylabel('amplitude')
%% c impulse response & frequency response magnitude and group delay for z=1/0.77
b=1;
a=[1 -0.77];
imp = [1; zeros(63,1)];
imp = [zeros(64,1);imp(:)];
imp = imp';
n=linspace(-64,63,128);
y = filter(b,a,imp);
y = fliplr(y);
plot(n,y);
xlabel('n')
ylabel('amplitude')
title('impulse response of H_c(1/z) (when z>0.77)')

figure
Y = fft(y, 128);
[gd,w] = gdel(y,n,128);
subplot(3,1,1)
plot(w,abs(Y))
title('magnitude of H_c[z] (when z>0.77)')
xlabel('w (-\pi to \pi)')
ylabel('amplitude')

subplot(3,1,2)
plot(w,angle(Y))
title('phase of H_c[z] (when z>0.77)')
xlabel('w (-\pi to \pi)')
ylabel('amplitude')

subplot(3,1,3)
plot(w,gd)
title('group delay of H_c[z] (when z>0.77)')
xlabel('w (-\pi to \pi)')
ylabel('amplitude')