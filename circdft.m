function [yc, yd] = circdft(x, h)
N = max(length(x),length(h));
yc=cconv(x,h,N)
a = fft (x,N);
b = fft (h,N);
c = a.*b;
yd = ifft(c, N)

subplot(4, 1, 1)
stem(x)
title("First Sequence")
grid
xlabel("samples")
ylabel("amplitudes")
legend("102115096 Isha")

subplot(4, 1, 2)
stem(h)
title("Second Sequence")
grid
xlabel("samples")
ylabel("amplitudes")
legend("102115096 Isha")
subplot(4, 1, 3)
stem(yc)
title("Circular Convolution using inbuilt")
grid
xlabel("samples")
ylabel("amplitudes")
legend("102115096 Isha")

subplot(4, 1, 4)
stem(yd)
title("Circular Convolution using idft and dft")
grid
xlabel("samples")
ylabel("amplitudes")
legend("102115096 Isha")