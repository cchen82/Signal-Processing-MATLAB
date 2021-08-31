n=linspace(1,128,128);
n=n-65;
delta=zeros(size(n));
delta1=delta;
delta1(65+5)=1;
delta(65-5)=1;
[gd,w]=gdel(delta,n,128);
[gd1,w1]=gdel(delta1,n,128);
subplot(3,1,1)
hold on
stem(n,delta,'b');
stem(n,delta1,'r');
xlim([-10,10]);
title('delta[n-n0]');
xlabel('n');
ylabel('amplitude');
legend('n0=-5','n0=+5');
hold off

subplot(3,1,2);
stem(w,gd);
xlabel('w');
ylabel('amplitude');
title('group delay (n0=-5)');
xlim([-pi,pi]);

subplot(3,1,3);
stem(w1,gd1,'r');
xlabel('w');
ylabel('amplitude');
title('group delay (n0=+5)');
xlim([-pi,pi]);
