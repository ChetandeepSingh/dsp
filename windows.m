M = 25;
t = (0:1:M-1)
A = ones(1,M)
stem(t,A,'g')
xlabel('Normalized Time')
title('Time Response of a rect window(102115096)')
grid on;
ylabel('Normalized Magnitude')
figure
[H,w] = freqz(A,1,1024);
wN = w./(2*pi);
HN = abs(H) ./ max(abs(H));

plot(wN,20.*log10(HN),'b')
grid
xlabel('Normalized Frequency')
title('Frequency Response of a rect window(102115096)')
grid on;
ylabel('Normalized Magnitude')
hold on %NP
M = 49
t = (0:1:M-1)
AH = ones(1,M)
[H,w] = freqz(AH,1,1024);
wN = w./(2*pi);
HN = abs(H) ./ max(abs(H));
plot(wN,20.*log10(HN),'r')
hold off %NP
legend('M=25 ---> M = 49')


%% HAMMING WINDOW
figure
M = 25
t = (0:1:M-1)
AH = 0.54-0.46*cos((2.*pi.*t)./(M-1));
stem(t,AH,'r');
xlabel('Normalized Time')
title('Time Response of a hamming window(102115096)')
grid on;
ylabel('Normalized Magnitude')
figure
[H,w] = freqz(AH,1,1024);
wN = w./(2*pi);
HN = abs(H) ./ max(abs(H));
plot(wN,20.*log10(HN),'b')
grid
xlabel('Normalized Frequency')
title('Frequency Response of a Hamming window(102115096)')
grid on;
ylabel('Normalized Magnitude')
hold on %NP
M = 49
t = (0:1:M-1)
AH = 0.54-0.46*cos((2.*pi.*t)./(M-1));
[H,w] = freqz(AH,1,1024);
wN = w./(2*pi);
HN = abs(H) ./ max(abs(H));
plot(wN,20.*log10(HN),'r')
hold off %NP
legend('M=25 ---> M = 49')
%% BERLTET WINDOW
figure
M = 25
t = (0:1:M-1)
AH = zeros(1,M);

for k = 0:(M-1)/2
    AH(1,k+1) = 2*k/(M-1);
end
for k = ((M-1)/2 + 1):(M-1)
    AH(1,k+1) = 2 - (2*k/(M-1));
end

stem(t,AH,'m')

xlabel('n------>')
title('Time Response of a Barltett window(102115096)')
grid on;
ylabel('Amplitude')
figure
[H,w] = freqz(AH,1,1024);
wN = w./(2*pi);
HN = abs(H) ./ max(abs(H));
plot(wN,20.*log10(HN),'b')
grid
xlabel('Normalized Frequency')
title('Frequency Response of a Barltett window(102115096)')
grid on;
ylabel('Normalized Magnitude')
hold on %NP
M = 49
t = (0:1:M-1)
for k = 0:(M-1)/2
    AH(1,k+1) = 2*k/(M-1);
end
for k = ((M-1)/2 + 1):(M-1)
    AH(1,k+1) = 2 - (2*k/(M-1));
end
[H,w] = freqz(AH,1,1024);
wN = w./(2*pi);
HN = abs(H) ./ max(abs(H));
plot(wN,20.*log10(HN),'r')
hold off %NP
legend('M=25 ---> M = 49')