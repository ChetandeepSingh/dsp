function [XF, XT] = dft(x,N)
L=length(x)
if L<=N
    xz =[x, zeros(1,N-L)];
XF = zeros(1,N);
for k = 0:N-1
    for n=0: (N-1)
        XF(1,k+1) = XF(1,k+1) + xz(1,n+1)*exp((-1*1i*2*pi*(k)*(n))/N);
    end
end

subplot(2,1,1)
stem(0:N-1, abs(XF))
grid
title("Magnitude")
legend("102115095 Chetan")

subplot(2,1,2)
stem(0:N-1, angle(XF),'r')
title("Phase")
legend("102115095 Chetan")

XT = zeros(1,N);
for k = 0: N-1
    for n = 0: N-1
        XT(1,k+1) = XT(1,k+1) + XF(1,n+1)* exp((+1*1i*2*pi*k*n)/N);
    end
end

XT = XT ./N;
figure
C = abs(XT);
D = C(1,1:L);
subplot(2,1,1)
stem(0:L-1,D,'b')
grid
title("Magnitude")
legend("102115095 Chetan")

A = angle(XT)
B = A(1,1:L);
subplot(2,1,2)
stem(0:L-1,B,'r');
title("Phase")
legend("102115095 Chetan")
grid
else
    display('Check Values of L & N')
    XF=0;
    XT=0;
end