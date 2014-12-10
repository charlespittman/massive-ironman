<Qucs Schematic 0.0.18>
<Properties>
  <View=0,146,880,828,1.47428,0,60>
  <Grid=10,10,1>
  <DataSet=7.75.dat>
  <DataDisplay=7.75.dpl>
  <OpenDisplay=1>
  <Script=7.75.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Vdc V1 1 750 300 18 -26 0 1 "10 V" 1>
  <_BJT T_2N2222_1 1 600 350 12 -32 0 0 "npn" 0 "1e-14" 0 "1" 0 "1" 0 "0.3" 0 "0" 0 "100" 0 "0" 0 "0" 0 "1.5" 0 "0" 0 "2" 0 "200" 0 "3" 0 "0" 0 "0" 0 "3" 0 "1" 0 "10" 0 "25e-12" 0 "0.75" 0 "0.33" 0 "8e-12" 0 "0.75" 0 "0.33" 0 "1.0" 0 "0" 0 "0.75" 0 "0" 0 "0.5" 0 "400e-12" 0 "3" 0 "0.0" 0 "2" 0 "100e-9" 0 "26.85" 0 "0.0" 0 "1.0" 0 "1.0" 0 "0.0" 0 "1.0" 0 "1.0" 0 "0.0" 0 "0.0" 0 "3.0" 0 "1.11" 0 "26.85" 0 "1.0" 0>
  <GND * 1 750 330 0 0 0 0>
  <.DC DC1 1 80 680 0 37 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <R Re 1 600 570 15 -26 0 1 "10k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <C C2 1 700 510 -26 17 0 0 "1 pF" 1 "" 0 "neutral" 0>
  <Vdc V2 1 600 630 18 -26 0 1 "-10 V" 1>
  <GND * 1 600 660 0 0 0 0>
  <GND * 1 770 600 0 0 0 0>
  <R RL 1 770 570 15 -26 0 1 "RL" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <C C1 1 250 350 -26 17 0 0 "1 pF" 1 "" 0 "neutral" 0>
  <R Rs 1 170 350 -8 12 0 0 "2k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <R Rb 1 310 420 15 -26 0 1 "100k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <GND * 1 100 460 0 0 0 0>
  <GND * 1 310 450 0 0 0 0>
  <IProbe Ib 1 450 300 -26 16 0 0>
  <IProbe Ie 1 600 440 -26 -26 0 3>
  <IProbe Ic 1 700 220 -26 16 1 2>
  <.SW SW1 1 250 540 0 59 0 0 "AC1" 1 "list" 1 "RL" 1 "5 Ohm" 0 "50 Ohm" 0 "[0.2k; 2k; 20k]" 1>
  <Eqn Eqn1 1 390 550 -23 12 0 0 "Gain=Output.v/Input.v" 1 "Gain_dB=dB(Gain)" 1 "Phase=phase(Output.v/Input.v)" 1 "yes" 0>
  <.AC AC1 1 80 540 0 37 0 0 "log" 1 "1 Hz" 1 "100 GHz" 1 "41" 1 "no" 0>
  <Vac V3 1 100 430 18 -26 0 1 "1 V" 1 "AC1" 0 "0" 0 "0" 0>
</Components>
<Wires>
  <600 510 600 540 "" 0 0 0 "">
  <600 510 670 510 "" 0 0 0 "">
  <730 510 770 510 "" 0 0 0 "">
  <770 510 770 540 "" 0 0 0 "">
  <280 350 310 350 "" 0 0 0 "">
  <200 350 220 350 "" 0 0 0 "">
  <310 350 310 390 "" 0 0 0 "">
  <600 470 600 510 "" 0 0 0 "">
  <600 380 600 410 "" 0 0 0 "">
  <600 220 600 320 "" 0 0 0 "">
  <600 220 670 220 "" 0 0 0 "">
  <750 220 750 270 "" 0 0 0 "">
  <730 220 750 220 "" 0 0 0 "">
  <360 300 420 300 "" 0 0 0 "">
  <360 300 360 350 "" 0 0 0 "">
  <310 350 360 350 "" 0 0 0 "">
  <480 300 530 300 "" 0 0 0 "">
  <530 300 530 350 "" 0 0 0 "">
  <530 350 570 350 "" 0 0 0 "">
  <100 350 140 350 "" 0 0 0 "">
  <100 350 100 400 "" 0 0 0 "">
  <770 510 770 510 "Output" 800 480 0 "">
  <100 350 100 350 "Input" 40 320 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
