clc
clear all;
Ag=0.2
As=40
sf=8000
fp=2000
fs=3500
ds=10^(-0.05*As)
dp=10^(-0.05*Ag)
wp=(2*fp)/sf;
ws=(2*fs)/sf;
n1=0.5*log10(((1/ds^2)-1)/((1/dp^2)-1)/log10(ws/wp))
n=ceil(n1);
wc=wp/((1/dp^2)-1)^(1/(2*n));
[b,a,k]=butter(n,wc,'low');
tf1=zp2tf(b,a,k);
fvtool(tf1);
title('butterworth prototype')
legend('102115095')
[bz,az]=impinvar(b,a,1);
tf2=zp2tf(bz',az',k)
fvtool(tf2);
title('butterworth compliment prototype')
legend('102115095')
