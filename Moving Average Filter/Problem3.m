%author: Chen Chen

%part a-c
close all
n=linspace(0,100,100);
s=2*n.*(0.9).^n;%s is signal
db=10*log10(1);
w=wgn(1,100,db);%w is noise
w=w-mean(w);
x=s+w;%x is signal added with noise
figure
stem(n,s,'LineStyle','-.',...
     'MarkerFaceColor','green',...
     'MarkerEdgeColor','green');
hold on
stem(n,w,'LineStyle','-.',...
     'MarkerFaceColor','blue',...
     'MarkerEdgeColor','blue');
stem(n,x,'LineStyle','-.',...
     'MarkerFaceColor','red',...
     'MarkerEdgeColor','red');
hold off
grid on
legend('s[n]signal','w[n]white noise','x[n] total signal');
xlabel('0 < n < 100');
ylabel('signal amplitude');
title('partC:input signal/white noise/total input signal');
%part d
M=5;
M1=0;
M2=M-1;
windowSize=M1+M2+1;
b=(1/windowSize)*ones(1,windowSize);
a=1;
y=filter(b,a,x);
figure
stem(n,s,'LineStyle','-.',...
     'MarkerFaceColor','green',...
     'MarkerEdgeColor','green');
hold on
stem(n,y,'LineStyle','-.',...
     'MarkerFaceColor','red',...
     'MarkerEdgeColor','red');
legend('Input Signal','Filtered Output Signal');
xlabel('0 < n < 100');
ylabel('signal amplitude');
title('partD:5 point MA filter with white noise input');
grid on
hold off

%part e
f=0.2;
w_int=cos(2*pi*n.*f);
x_int=s+w_int;
M=4;
M1=0;
M2=M-1;
windowSize=M1+M2+1;
b=(1/windowSize)*ones(1,windowSize);
a=1;
y=filter(b,a,x_int);
figure
stem(n,s,'LineStyle','-.',...
     'MarkerFaceColor','green',...
     'MarkerEdgeColor','green');
hold on
stem(n,y,'LineStyle','-.',...
     'MarkerFaceColor','red',...
     'MarkerEdgeColor','red');
legend('Input Signal','Filtered Output Signal');
xlabel('0 < n < 100');
ylabel('signal amplitude');
title('partE:4 point MA filter with interference signal')
grid on
hold off

M=5;
M1=0;
M2=M-1;
windowSize=M1+M2+1;
b=(1/windowSize)*ones(1,windowSize);
a=1;
y=filter(b,a,x_int);
figure
stem(n,s,'LineStyle','-.',...
     'MarkerFaceColor','green',...
     'MarkerEdgeColor','green');
hold on
stem(n,y,'LineStyle','-.',...
     'MarkerFaceColor','red',...
     'MarkerEdgeColor','red');
legend('Input Signal','Filtered Output Signal');
xlabel('0 < n < 100');
ylabel('signal amplitude');
title('partE:5 point MA filter with interference signal')
grid on
hold off

M=6;
M1=0;
M2=M-1;
windowSize=M1+M2+1;
b=(1/windowSize)*ones(1,windowSize);
a=1;
y=filter(b,a,x_int);
figure
stem(n,s,'LineStyle','-.',...
     'MarkerFaceColor','green',...
     'MarkerEdgeColor','green');
hold on
stem(n,y,'LineStyle','-.',...
     'MarkerFaceColor','red',...
     'MarkerEdgeColor','red');
legend('Input Signal','Filtered Output Signal');
xlabel('0 < n < 100');
ylabel('signal amplitude');
title('partE:6 point MA filter with interference signal')
grid on
hold off


