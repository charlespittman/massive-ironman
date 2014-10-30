#I know that x=0 is NaN, so I need to manually put in values to the array (0.5 here)
#Dn = 0.5 .* j.*(-2.*cos(2.*n) + (1./n).*sin(2.*n));
#Dn(n==0) = 0.5

n = -10:10;
xn = [0 2 4 -4 -2 0 2 4 -4 -2 0 2 4 -4 -2 0 2 4 -4 -2 0];

figure 1
stem(n,xn)
title("Original Signal")
xlabel("Signal,x[n]")
ylabel("Discrete Time, n")

figure 2

## This is a dumb way to do it.  Need to factor it into a for-loop
x = 0;
D0=(1/N0) * (xt(1) *  exp(-j*0.*x*(2*pi/5)) +
             xt(2) *  exp(-j*1.*x*(2*pi/5)) +
             xt(3) *  exp(-j*2.*x*(2*pi/5)) +
             xt(4) *  exp(-j*3.*x*(2*pi/5)) +
             xt(5) *  exp(-j*4.*x*(2*pi/5)))

x = 1;
D1=(1/N0) * (xt(1) *  exp(-j*0.*x*(2*pi/5)) +
             xt(2) *  exp(-j*1.*x*(2*pi/5)) +
             xt(3) *  exp(-j*2.*x*(2*pi/5)) +
             xt(4) *  exp(-j*3.*x*(2*pi/5)) +
             xt(5) *  exp(-j*4.*x*(2*pi/5)))

x = 2;
D2=(1/N0) * (xt(1) *  exp(-j*0.*x*(2*pi/5)) +
             xt(2) *  exp(-j*1.*x*(2*pi/5)) +
             xt(3) *  exp(-j*2.*x*(2*pi/5)) +
             xt(4) *  exp(-j*3.*x*(2*pi/5)) +
             xt(5) *  exp(-j*4.*x*(2*pi/5)))

x = 3;
D3=(1/N0) * (xt(1) *  exp(-j*0.*x*(2*pi/5)) +
             xt(2) *  exp(-j*1.*x*(2*pi/5)) +
             xt(3) *  exp(-j*2.*x*(2*pi/5)) +
             xt(4) *  exp(-j*3.*x*(2*pi/5)) +
             xt(5) *  exp(-j*4.*x*(2*pi/5)))

x = 4;
D4=(1/N0) * (xt(1) *  exp(-j*0.*x*(2*pi/5)) +
             xt(2) *  exp(-j*1.*x*(2*pi/5)) +
             xt(3) *  exp(-j*2.*x*(2*pi/5)) +
             xt(4) *  exp(-j*3.*x*(2*pi/5)) +
             xt(5) *  exp(-j*4.*x*(2*pi/5)))

#Dk = D0 + D1 + D2 + D3 + D4
Dk = [D0 D1 D2 D3 D4]

magDk = abs(Dk);
phaseDk = angle(Dk) * (180/pi)

#W = n.*(pi/2)

#|Dn| vs omega
#subplot(2,1,1)
#plot(W,magDn)

# Phase(Dn) vs. omega
#subplot(2,1,2)
#plot(W,phaseDn)

plot(Dk)


N0 = 5;
k = 0:(N0-1)
