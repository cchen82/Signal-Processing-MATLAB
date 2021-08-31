%% Part B adaptive equalization
clear all
close all
n = linspace(1,1000,1000);
u = 0.08;
e = ones(1,1000);
w = zeros(1,1000);
y = zeros(1,1000);

%generate random bits
s = zeros(1,1000);
for i=1:length(s)
    if 10*rand>5
        s(i)=1;
    else
        s(i)=-1;
    end
end
d=s;
%channel unit-sample response
h=[.15 -.1 .7 -.2 0.1];
h_next=0;
%convolute with bit sequence
x1=filter(h,1,s);


%generate random noise
noise = 0.01*rand(1,1000);
%complete input sequence recieved
x = x1+noise;

%adaptive equalization
for n= 1 : 300
    y = w .* x;
    e = d - y;
    wprev = w;
    w=wprev + 2*u*e.* x;
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
plot(e)
title('difference between output and desired input (iteration of 1000)');grid on
xlabel('n');ylabel('amplitude');
subplot(3,1,3)
plot(error)
title('total error over time');grid on
xlabel('time');ylabel('amplitude');

figure(3)
%hold on ; freqz(x);
hold on; freqz(filter(h,1,noise)); title('frequency response of channel with noise');
hold on; freqz(w); title('frequency response of equalizer');
hold off ;
legend('channel with noise freqz','equalizer frez');
lines = findall(gcf,'type','line');
set(lines(1),'Color','red')
set(lines(2),'Color','green')
title('frequency response');grid on

figure(4)
zplane(h);grid on;
title('pole-zero plot of channel')

figure(5)
subplot(2,1,1);impz(h);grid on
title('impulse response of channel')
xlabel('n');ylabel('amplitude');
subplot(2,1,2);impz(w);grid on
title('impulse response of equalizer')
xlabel('n');ylabel('amplitude');
ylim([-8 8])

%estimate output to input LTI system
channel=filter(h,1,noise).*w;
figure(6)
subplot(2,1,1)
freqz(channel)
title('frequency response of LTI blackbox')
subplot(2,1,2)
impz(channel)
title('impulse response of LTI blackbox')



