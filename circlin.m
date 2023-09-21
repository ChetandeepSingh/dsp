function [y] = circlin(x,h)
a1=length(x);
a2=length(h);
NL = a1 + a2 -1;
NC = max(a1,a2);

y = conv(x,h)
y1 = [y(1:NC)];
y2 = [y(NC+1:NL),zeros(1,NL-NC)];


for i = 1:NC
    C(i) = y1(i) + y2(i);
end
C
subplot(2,1,1)
stem(C);
title('Circular convolution using Linear')
grid
xlabel("samples")
ylabel("amplitudes")
legend("102115096 Isha")

circularMatlab = cconv(x,h,NC)
subplot(2,1,2)
stem(circularMatlab)
title('Circular inbuilt')
legend("102115096 Isha")
xlabel("samples")
ylabel("amplitudes")
grid