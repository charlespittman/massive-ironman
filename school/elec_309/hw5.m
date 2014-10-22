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

# T = 5*(1/2);
# Fs = 1000;
# dt = 1/Fs;
# t = -10:dt:10;
# x = 4*sawtooth(pi*t);
# plot(t,x)
# grid on;

n = -10:10;
Dn = 0.5 .* j.*(-2.*cos(2.*n) + (1./n).*sin(2.*n));

magDn = abs(Dn);
phaseDn = angle(Dn) * (180/pi)

W = n.*(pi/2)

subplot(2,1,1)
plot(W,magDn)
subplot(2,1,2)
plot(W,phaseDn)