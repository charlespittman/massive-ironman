%e302_1
%rjb  15Jan 07
%compute pre-lab #1 values
clear
E1 =60;
w  = 60*2*pi;
R = [1200,1200,1200,1200,1200,1200,1200,1200]';
L = [.8,.8,.8,.8,1.6,1.6,1.6,1.6]';
C = [0,2.2,4.4,8.8,0,2.2,4.4,8.8]'*1.0e-6;
ZL= 40 + j*w*L;  %include resitance of L
%ZL = j*w*L;
ZC =1./(j*w*C) ;
IR = E1./R;
IL = E1./ZL;
IC = E1./ZC;
I1 = IR + IL +IC;
S = E1.*conj(I1);
P =real(S);
Q = imag(S);
ang = angle(S)*180/pi;
pf = cos(ang*pi/180);
format compact
I1 = abs(I1);
S = abs(S);
[I1, P, ang, S, Q, pf]
