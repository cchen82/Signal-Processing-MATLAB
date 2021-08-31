function [X,c2]=DFT1(x,N)
c=clock;
X=fft(x,N);
c1=clock;
c2= c1-c;
end
