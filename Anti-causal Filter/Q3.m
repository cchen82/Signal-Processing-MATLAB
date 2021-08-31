%% 0.77 impulse response
b=1;
a=[1 -0.77];
imp = [1; zeros(63,1)];
imp = [zeros(64,1);imp(:)];
n=linspace(-64,63,128);
y = filter(b,a,imp);
y=y';
imp=imp';
stem(n,imp)
hold on
stem(n,y)
legend('Input Data','Filtered Data')
title('Z>0.77')
xlabel('n')
ylabel('amplitude')
hold off
%%  0.77 frequency response magnitude and group delay
figure
Y = fft(y, 128);
[gd,w] = gdel(y,n,128);
subplot(3,1,1)
plot(w,abs(Y))
title('magnitude of H[z] (when z>0.77)')
xlabel('w (-\pi to \pi)')
ylabel('amplitude')

subplot(3,1,2)
plot(w,angle(Y))
title('phase of H[z] (when z>0.77)')
xlabel('w (-\pi to \pi)')
ylabel('amplitude')

subplot(3,1,3)
plot(w,gd)
title('group delay of H[z] (when z>0.77)')
xlabel('w (-\pi to \pi)')
ylabel('amplitude')
%% %% 0.95 impulse response
b=1;
a=[1 -0.95];
imp = [1; zeros(63,1)];
imp = [zeros(64,1);imp(:)];
n=linspace(-64,63,128);
y = filter(b,a,imp);
y=y';
imp=imp';
stem(n,imp)
hold on
stem(n,y)
legend('Input Data','Filtered Data')
title('Z>0.95')
xlabel('n')
ylabel('amplitude')
hold off
%%  0.95 frequency response magnitude and group delay
figure
Y = fft(y, 128);
[gd,w] = gdel(y,n,128);
subplot(3,1,1)
plot(w,abs(Y))
title('magnitude of H[z] (when z>0.95)')
xlabel('w (-\pi to \pi)')
ylabel('amplitude')

subplot(3,1,2)
plot(w,angle(Y))
title('phase of H[z] (when z>0.95)')
xlabel('w (-\pi to \pi)')
ylabel('amplitude')

subplot(3,1,3)
plot(w,gd)
title('group delay of H[z] (when z>0.95)')
xlabel('w (-\pi to \pi)')
ylabel('amplitude')