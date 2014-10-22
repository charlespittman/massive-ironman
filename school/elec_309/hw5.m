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
t = -10:dt:10;
x = 4*sawtooth(pi*t);
plot(t,x)
grid on;

#[pxx,f] = periodogram(x,[],length(x),Fs,'power');
#plot(f,pxx)