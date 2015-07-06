clear, close all, clc
%%  G(s)H(s) = s^2 - 4s + 20
%%             -------------
%%             s^2 + 6s +  8

numgh = [1 -4 20];              % Define numerator of G(s)H(s).
dengh = [1 6 8];                % Define denominator of G(s)H(s).
GH = tf(numgh,dengh);           % Create G(s)H(s) transfer function object.
printsys(numgh,dengh);                   % Display G(s)H(s).
figure(1)                       % Switch to Figure 1.
rlocus(GH)                     % Draw root locus.

z=0.2:0.05:0.5;                 % Define damping ratio values:  0.2 to 0.5 in steps of 0.05.
wn=0:1:10;                      % Define natural frequency values:  0 to 10 in steps of 1.
sgrid(z,wn)                     % Generate damping ratio and natural frequency grid lines for
                                % root locus.

figure(2)                       % Switch to Figure 2.
rlocus(GH)                      % Draw close-up root locus.
axis([-3 1 -4 4])               % Define range on axes for root locus close-up view.
title('Close-up')               % Define title for close-up root locus.
z=0.45;                         % Define damping ratio line for overlay on close-up root locus.
wn=0;                           % Suppress natural frequency overlay curves.
sgrid(z,wn)                     % Overlay damping ratio curve on close-up root locus.

for k=1:3                       % Loop allows 3 points to be selected (z=0.45, jw crossing, breakaway).
    
    [K,p]=rlocfind(GH)          % Generate gain K and closed-loop poles p for point
                                % slected interactively on the root locus.
end                             % End loop
