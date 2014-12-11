<Qucs Schematic 0.0.17>
<Properties>
  <View=-120,-120,1090,1117,0.826446,0,0>
  <Grid=10,10,1>
  <DataSet=7.39.dat>
  <DataDisplay=7.39.dpl>
  <OpenDisplay=0>
  <Script=7.39.m>
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
  <.DC DC1 1 20 120 0 34 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <.AC AC1 1 20 180 0 34 0 0 "log" 1 "1 Hz" 1 "10 MHz" 1 "701" 1 "no" 0>
  <C CC1 1 340 130 -26 17 0 0 "10uF" 1 "" 0 "neutral" 0>
  <R Ri 1 280 130 -26 15 0 0 "2k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <Vac V1 1 210 190 18 -26 0 1 "1 V" 1 "1 GHz" 0 "0" 0 "0" 0>
  <GND * 1 210 220 0 0 0 0>
  <R R1 1 370 100 15 -26 0 1 "234k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <R R2 1 370 160 15 -26 0 1 "166k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <GND * 1 370 190 0 0 0 0>
  <_MOSFET T1 1 450 130 8 -26 0 0 "nfet" 0 "2.0 V" 1 "0.5e-3" 1 "0.0" 0 "0.6 V" 0 "0.0" 1 "0.0 Ohm" 0 "0.0 Ohm" 0 "0.0 Ohm" 0 "1e-14 A" 0 "1.0" 0 "1 um" 0 "1 um" 0 "0.0" 0 "0.1 um" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0 F" 0 "0.0 F" 0 "0.8 V" 0 "0.5" 0 "0.5" 0 "0.0" 0 "0.33" 0 "0.0 ps" 0 "0.0" 0 "0.0" 0 "1" 0 "600.0" 0 "0.0" 0 "1" 0 "1" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0 m" 0 "0.0 m" 0 "0.0" 0 "1.0" 0 "1.0" 0 "26.85" 0 "26.85" 0>
  <R Rs 1 450 210 15 -26 0 1 "500" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <C CC2 1 540 180 -26 17 0 0 "10uF" 1 "" 0 "neutral" 0>
  <R RL 1 570 230 15 -26 0 1 "4k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <GND * 1 570 260 0 0 0 0>
  <GND * 1 450 240 0 0 0 0>
  <GND * 1 640 260 0 0 0 0>
  <Vdc V2 1 550 60 18 -26 0 1 "1 V" 1>
  <GND * 1 550 90 0 0 0 0>
  <C CL 1 640 230 17 -26 0 1 "121 pF" 1 "" 0 "neutral" 0>
  <Eqn Eqn1 1 760 50 -23 12 0 0 "Gain=dB(Output.v/Input.v)" 1 "Phase=phase(Output.v/Input.v)" 1 "yes" 0>
  <Eqn Eqn2 1 760 150 -23 14 0 0 "MAXgain=max(Gain)" 1 "yes" 0>
</Components>
<Wires>
  <210 130 250 130 "" 0 0 0 "">
  <210 130 210 160 "" 0 0 0 "">
  <370 30 450 30 "" 0 0 0 "">
  <370 30 370 70 "" 0 0 0 "">
  <370 130 420 130 "" 0 0 0 "">
  <450 160 450 180 "" 0 0 0 "">
  <450 180 510 180 "" 0 0 0 "">
  <570 180 570 200 "" 0 0 0 "">
  <450 30 450 100 "" 0 0 0 "">
  <570 180 640 180 "" 0 0 0 "">
  <640 180 640 200 "" 0 0 0 "">
  <450 30 550 30 "" 0 0 0 "">
  <210 130 210 130 "Input" 190 80 0 "">
  <640 180 640 180 "Output" 660 150 0 "">
</Wires>
<Diagrams>
  <Rect 20 623 629 323 3 #c0c0c0 1 10 1 1 1 1e+07 1 -265.863 20 -98.4193 1 -1 0.2 1 315 0 225 "Frequency (Hz)" "Gain (dB)" "">
	<"Gain" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 20 984 630 304 3 #c0c0c0 1 10 1 1 1 1e+07 0 0 30 180 1 -1 0.5 1 315 0 225 "Frequency (Hz)" "Phase (°)" "">
	<"Phase" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>