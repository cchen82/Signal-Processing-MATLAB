clear all
close all
n = linspace(1,1000,1000);
e = ones(1,1000);
g = ones(1,1000);
y=ones(1,1000);
%generate random bits
s=zeros(1,1000);
for i=1:length(s)
    if 10*rand>5
        s(i)=1;
    else
        s(i)=-1;
    end
end
d=s;
%channel unit-sample response
h=[2 -.1 .7 -2];
%convolute with bit sequence
x1=filter(h,1,s);
%generate random noise
noise = 0.1*rand(1,1000);
%complete input sequence recieved
x = x1+noise;

u = 0.00003;
%blind equalization
for n= 1 : 200000
    y = g .* x;
    e = y.^2-1;
    gprev = g;
    g=gprev - u*(e).*y.* x;
    error(n)=sum(abs(e));
end

%graph
figure(1)
subplot(3,1,1)
stem(1:20,d(1:20))
title('desired sequence (1 through 20 samples)');grid on
subplot(3,1,2)
stem(1:20,x(1:20))
title('output sequence before equalization (1 through 20 samples)');grid on
subplot(3,1,3)
stem(1:20,y(1:20))
title('output sequence after equalization (1 through 20 samples)');grid on

figure(2)
subplot(3,1,1)
stem(y)
title('output after equalizer');grid on
xlabel('n');ylabel('amplitude');
subplot(3,1,2)
plot(y-d)
title('difference between output and desired input (order of 1000)');grid on
xlabel('n');ylabel('amplitude');
subplot(3,1,3)
plot(error)
title('total error over time');grid on
xlabel('time');ylabel('amplitude');
xlim([10000,200000])

figure(3)
freqz(x);hold on
freqz(y);hold on
freqz(d);hold on
freqz(g);hold on