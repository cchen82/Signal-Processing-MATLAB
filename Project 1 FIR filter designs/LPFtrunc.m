function filterResponse = LPFtrunc(N)
n = linspace(-N/2,N/2,N);
wc= 2; % cut off frequency
filterResponse = (wc./pi)*sinc(wc.*n./pi); % impluse response for the low pass filter
end
