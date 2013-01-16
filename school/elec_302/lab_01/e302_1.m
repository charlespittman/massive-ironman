%e302_1
%rjb  15Jan 07
%compute pre-lab #1 values
clear
E1 =[60.9 60.9 60.9 61.0 61.0 61.0 61.0 61.3]';
%w  = 60*2*pi;
%R = [1200,1200,1200,1200,1200,1200,1200,1200]';
%L = [.8,.8,.8,.8,1.6,1.6,1.6,1.6]';
%C = [0,2.2,4.4,8.8,0,2.2,4.4,8.8]'*1.0e-6;
%ZL= 40 + j*w*L;  %include resitance of L
%ZL = j*w*L;
%ZC =1./(j*w*C) ;
%IR = E1./R;
%IL = E1./ZL;
%IC = E1./ZC;
%I1 = IR + IL +IC;
%S = E1.*conj(I1);
%P =real(S);
P = [4.53 4.56 4.59 4.65 3.94 3.96 3.99 4.05]';
%Q = imag(S);
%ang = angle(S)*180/pi;
ang = [68 60.9 49 -4.4 5.4 32.8 -6.6 -57.4]';
pf = cos(ang.*pi/180);
format compact
%I1 = abs(I1);
%S = abs(S);
I1 = [.206 .158 .117 .081 .116 .079 .067 .124]';
S = E1.*I1;
Q = P.*tan(ang.*pi/180)
I1
P
%S.*pf
%S.*sin(ang.*pi/180)
ang
S
Q
pf
