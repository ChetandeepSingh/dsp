function [y] = circular(x,h)
L = length(x);
n = length(h);
a = [x, zeros(1,n)];
b = [h, zeros(1,L)];
N = max(L,n);
for i = 1 : N
    y(i) = 0;
    for j = 1 : N
        y(i) = y(i) + a(j).*b(mod(i-j,N)+1);
    end
end
y

subplot(4,1,1)
stem(x)
title("First Sequence")
grid
xlabel("samples")
ylabel("amplitudes")
legend("102115096 Isha")

subplot(4,1,2)
stem(h)
title("Second Sequence")
grid
xlabel("samples")
ylabel("amplitudes")
legend("102115096 Isha")

subplot(4,1,3)
stem(y)
title("Circular Convolution")
grid
xlabel("samples")
ylabel("amplitudes")
legend("102115096 Isha")

circularmatlab=cconv(x,h,N)
subplot(4,1,4)
stem(circularmatlab)
title("Circular Convolution using in-build function")
grid
xlabel("samples")
ylabel("amplitudes")
legend("102115096 Isha")