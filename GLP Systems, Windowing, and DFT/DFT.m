function [X,c2]=DFT(x,N)
%x(n) is the sequence in time domain
%N is number of division in 2pi circle
c=clock;
j=sqrt(-1);
a=cos(2*pi/N);
b=j*sin(2*pi/N);
W=(a-b);
 
[I,J]=meshgrid(1:N,1:N);
WW=W.^((I-1).*(J-1));
X=x*WW;
 
c1=clock;
c2=c1-c;
fprintf('time used is %i\n\n',c2)
end
