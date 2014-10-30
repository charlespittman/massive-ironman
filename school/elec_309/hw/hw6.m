n = -10:10;
xn = [0 2 4 -4 -2 0 2 4 -4 -2 0 2 4 -4 -2 0 2 4 -4 -2 0];

figure 1

stem(n,xn)
title("Original Signal")
xlabel("Signal,x[n]")
ylabel("Discrete Time, n")


figure 2

N0 = 5;

## subindexes have to be >0, which is why
for x=0:10
  D(x+1) = (1/N0) * (xn(1) *  exp(-j*0.*x*(2*pi/5)) +
                     xn(2) *  exp(-j*1.*x*(2*pi/5)) +
                     xn(3) *  exp(-j*2.*x*(2*pi/5)) +
                     xn(4) *  exp(-j*3.*x*(2*pi/5)) +
                     xn(5) *  exp(-j*4.*x*(2*pi/5)))
end

Dk = [D(1) D(2) D(3) D(4) D(5) D(6) D(7) D(8) D(9) D(10)]

magDk = abs(Dk);
phaseDk = angle(Dk) * (180/pi)

subplot(2,1,1)
plot(magDk)
title("|Dk| vs. k")
xlabel("k+1")

subplot(2,1,2)
plot(phaseDk)
title("phase(Dk) vs. k")
xlabel("k+1")
