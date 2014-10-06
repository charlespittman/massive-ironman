t = [-10:.01:10];
unit = @(t) 1.*(t>=0);

x1 = @(t) (unit(t)-unit(t-2));
h1 = @(t) exp(-1*t).*unit(t);
y1 = @(t) x1.*h1;
z1 = conv(x1(t), h1(t), "same");

subplot(3,1,1)
plot(t,x1(t));
subplot(3,1,2)
plot(t,h1(t));
subplot(3,1,3)
plot(t,z1);
