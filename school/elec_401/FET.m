clear;
clf;
answer=inputdlg({'kn`' , 'W/L' , 'Vto' , '\lambda'},'FET Parameters',1,{'5e-3','2','1.8','0'});
Knp=str2double(answer(1));
WL=str2double(answer(2));
VTN=str2double(answer(3));
Ld=str2double(answer(4));
answer2=inputdlg({'Vdd' , 'Rd+Rs'},'Circuit Parameters',1,{'25','25'});
Vdd=str2double(answer2(1));
Rt=str2double(answer2(2));
[Vds,Vgs]=meshgrid([0:1:30],[0:.5:20]);
LL=(-1/Rt)*Vds+Vdd/Rt; %Load Line
KN=Knp*WL/2;
Id1=KN*(2*(Vgs-VTN).*Vds-Vds.^2).*(1+Ld*Vds).*(Vds<(Vgs-VTN)); %Triode Region
Id2=KN*((Vgs-VTN).^2).*(1+Ld*Vds).*(Vds>=(Vgs-VTN)); %Saturation Region
Id=(Id1+Id2).*(Vgs>VTN); %Drain Current, including cut-off region
surf(Vds,Vgs,Id,Id), xlabel('Vds'),ylabel('Vgs'),zlabel('Id'), view(0,0)
title('MOSFET Transfer Characterisitcs')
hold on
surf(Vds,Vgs,LL,LL-1)
hold off