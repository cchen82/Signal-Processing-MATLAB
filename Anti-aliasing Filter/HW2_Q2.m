close all
%part a
figure
n=linspace(-1,1,1024)*pi;
u=heaviside(n);
x=0.9.^n.*u;
[h,w]=freqz(x,n,'whole');
subplot(2,1,1)
plot(w,abs(h))
ylabel('Magnitude')
xlabel('rad')
xticks([0 1*pi 2*pi])
xticklabels({'-1\pi',0,'1\pi'})
subplot(2,1,2)
plot(w,angle(h))
ylabel('Phase')
xlabel('rad')
xticks([0 1*pi 2*pi])
xticklabels({'-1\pi',0,'1\pi'})

%part c
figure
omega=linspace(-1,1,1024)*pi;
x1=1./(1-0.9.*exp(-1i.*omega));
mag=sqrt(real(x1).^2+imag(x1).^2);
phase=atan(imag(x1)./real(x1));
subplot(2,1,1)
plot(omega,mag);
ylabel('Magnitude')
xlabel('rad')
xticks([-1*pi 0 1*pi])
xticklabels({'-1\pi',0,'1\pi'})
grid on
subplot(2,1,2)
plot(omega,phase);
ylabel('Phase')
xlabel('rad')
xticks([-1*pi 0 1*pi])
xticklabels({'-1\pi',0,'1\pi'})
grid on