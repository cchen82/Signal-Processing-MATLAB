close all
%a
n=linspace(0,80,100);
fs=8000;
t=n/fs;
f0=300;
x=sin(2*pi.*f0./fs.*n);
subplot(2,1,1)
plot(t,x);
subplot(2,1,2)
stem(t,x);

%b
for i=0:3
    f0=100+i*125
    subplot(4,1,i+1)
    x=sin(2*pi.*f0./fs.*n);
    stem(t*1000,x);
    xlabel('t (ms)');
    ylabel('magnitude');
    title(['frequency is',num2str(f0),'Hz']);
    grid on
end

%c
for i=0:3
    f0=7525+i*125
    subplot(4,1,i+1)
    x=sin(2*pi.*f0./fs.*n);
    stem(t*1000,x);
    xlabel('t (ms)');
    ylabel('magnitude');
    title(['frequency is ',num2str(f0),'Hz']);
    grid on
end

%d
for i=0:3
    f0=32100+i*125
    subplot(4,1,i+1)
    x=sin(2*pi.*f0./fs.*n);
    stem(t*1000,x);
    xlabel('t (ms)');
    ylabel('magnitude');
    title(['frequency is ',num2str(f0),'Hz']);
    grid on
end