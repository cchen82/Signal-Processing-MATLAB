close all
%b
f1=4000;%Hz
mu=600*(1e+3);%Hz/s
phi=0;%arbitrary
fs=8e+3;%sampling frequency
T=50e-3;%sampling period
n=T*fs;%number of samples
t=linspace(0,T,n);
fi=mu*t+f1;
c=cos(pi.*mu.*t.^2+2.*pi.*f1.*t+phi);
figure
plot(t*1e+3,c);
hold on
%stem(t*1e+3,c);
hold off
xlabel('t (ms)');
ylabel('amplitude');
title('stem and plot of c(t) when fs=8k Hz');

%c
f1=4000;%Hz
mu=600*(1e+3);%Hz/s
phi=0;%arbitrary
fs=70e+3;%sampling frequency
T=50e-3;%sampling period
n=T*fs;%number of samples
t=linspace(0,T,n);
fi=mu*t+f1;
c=cos(pi.*mu.*t.^2+2.*pi.*f1.*t+phi);
figure
plot(t*1e+3,c);
hold on
stem(t*1e+3,c);
hold off
xlabel('t (ms)');
ylabel('amplitude');
title('stem and plot of c(t) when fs=70k Hz');