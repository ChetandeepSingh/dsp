clc
clear all
%% hamming window
wp=0.2*pi;
ws=0.3*pi;
wc=(ws+wp)/2;
dw=(ws-wp);
m=49;
n=linspace(0,m-1,m);
hd=zeros(1,length(n));
hd=sin(wc.*((n-(m-1)/2)))./((pi.*(n-((m-1)/2))));
hd(1,((m-1)/2)+1)=(wc/pi);
wi=0.54-0.46*cos(2*pi*n/(m-1));
h=hd.*wi;
hp=h.*(-1).^(n-((m-1)/2));
[H,w]=freqz(hp,1,1024);
wn=w./(2*pi);
hn=abs(H)./max(abs(H));
subplot(1,2,1)
plot(wn,(20.*log10(hn)),'r');
grid
xlabel('\bf Normalized frequency')
ylabel('\bf Normalized frequency response (dB)')
title('\bf Highpass filter designed with hamming window function')
legend('Chetan 10211095')

%% hanning window
wi=0.5-0.5*cos(2*pi*n/(m-1));
h=hd.*wi;
hp=h.*(-1).^(n-(m-1)/2);
[H,w]=freqz(hp,1,1024);
wn=w./(2*pi);
hn=abs(H)./max(abs(H));
subplot(1,2,2)
plot(wn,(20.*log10(hn)),'r');
grid
xlabel('\bf Normalized frequency')
ylabel('\bf Normalized frequency response (dB)')
title('\bf Highpass filter designed with hanning window function ')
legend('Chetan 10211095')