function [gd, w] = gdel(x, n, Lfft)
%GDEL compute the group delay of x[n]
%
% x: Signal x[n] at the times (n)
% n: Vector of time indices
% Lfft: Length of the FFT used
% gd: Group delay values on [-pi, pi)
% w: List of frequencies over [-pi, pi)
%
% NOTE: Group delay of B(z)/A(z) = gdel(B) - gdel(A)
%
X = fft(x, Lfft);
dXdw = fft(n.*x, Lfft); % --- transform of nx[n]
gd = fftshift(real(dXdw./X )); % --- when X==0, gd=infinity
w = (2*pi/Lfft)*[0:(Lfft-1)] - pi;
