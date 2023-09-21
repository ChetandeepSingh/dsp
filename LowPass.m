clc
clear all
close all

passbandFreq = 0.2*pi
stopbandFreq = 0.3*pi
cutoffFreq = (passbandFreq+stopbandFreq)/2
transWidth = (-1*passbandFreq + stopbandFreq);

minCoeffecients = ceil(1.8*pi/transWidth)+1;
M = 49
n = linspace(0,M-1,M);
hd = zeros(1,length(n));
hd = sin(cutoffFreq.*(n-(M-1)/2))./((pi.*(n-(M-1)/2))); %desired response
hd(1,((M-1)/2)+1) = (cutoffFreq/pi);
WI = 1 - (2 * abs(n - (M-1)/2))/(M-1);
WI_RECT = ones(1,length(n));
h1 = hd.*WI_RECT;
h = hd.*WI;
[H1,w1] = freqz(h1,1,1024);
wN1 = w1./(2*pi);
HN1 = abs(H1)/ max(abs(H1));
plot(wN1, (20.*log10(HN1)),'k');
grid
[H,w] = freqz(h,1,1024);
wN = w./(2*pi);
HN = abs(H) / max(abs(H));
hold;
plot(wN,(20.*log10(HN)),'r');
xlabel('\bf Normalized Frequency ----->>')
ylabel('\bf Normalized Magnitude Response ----->>')
title(['\bf LOW PASS FIR(102115095 Chetan)'])
legend('Rectangular','Barlett')