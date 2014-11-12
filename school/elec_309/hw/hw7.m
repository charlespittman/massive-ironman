#n = -10:10;

#I know that x=0 is NaN, so I need to manually put in values to the array (0.5 here)
#Dn = 0.5 .* j.*(-2.*cos(2.*n) + (1./n).*sin(2.*n));
#Dn(n==0) = 0.5

#magDn = abs(Dn);
#phaseDn = angle(Dn) * (180/pi)

#W = n.*(pi/2)

#|Dn| vs omega
#subplot(2,1,1)
#plot(W,magDn)

# Phase(Dn) vs. omega
#subplot(2,1,2)
#plot(W,phaseDn)

# Tried to generate a sawtooth wave:

pkg load signal

# http://www.mathworks.com/help/signal/ref/sawtooth.html
# Generate 10 periods of a sawtooth wave with a fundamental frequency of 50 Hz. The sampling rate is 1 kHz.
# T = 10*(1/50);
# Fs = 1000;
# dt = 1/Fs;
# t = 0:dt:T-dt;
# x = sawtooth(2*pi*50*t);
# plot(t,x)
# grid on;

T = 5*(1/2);
Fs = 1000;
dt = 1/Fs;
t = -5:dt:5;
x = (2*j/3)*t*rectpuls(t,6);
plot(t,x)
axis([-5 5])
