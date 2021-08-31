function y = sinc_interp(t,x)
Ts=length(x)/length(t);
k = 0:length(x)-1;

for i=1:length(t)
  y(i) = sum(x.*sinc(pi*(t(i)-k*Ts)/Ts));
end