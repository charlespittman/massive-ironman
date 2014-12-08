<Qucs Schematic 0.0.17>
<Properties>
  <View=-30,131,712,908,1.3166,0,0>
  <Grid=10,10,1>
  <DataSet=amplifier.dat>
  <DataDisplay=amplifier.dpl>
  <OpenDisplay=1>
  <Script=amplifier.m>
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
  <_BJT T1 1 320 470 8 -26 0 0 "npn" 1 "1e-16" 1 "1" 1 "1" 0 "0" 0 "0" 0 "0" 1 "0" 0 "0" 0 "1.5" 0 "0" 0 "2" 0 "100" 1 "1" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0.75" 0 "0.33" 0 "0" 0 "0.75" 0 "0.33" 0 "1.0" 0 "0" 0 "0.75" 0 "0" 0 "0.5" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "26.85" 0 "0.0" 0 "1.0" 0 "1.0" 0 "0.0" 0 "1.0" 0 "1.0" 0 "0.0" 0 "0.0" 0 "3.0" 0 "1.11" 0 "26.85" 0 "1.0" 0>
  <R R2 1 320 570 15 -26 0 1 "22" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <_BJT T3 1 440 440 8 -26 0 0 "pnp" 1 "1e-16" 1 "1" 1 "1" 0 "0" 0 "0" 0 "0" 1 "0" 0 "0" 0 "1.5" 0 "0" 0 "2" 0 "100" 1 "1" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0.75" 0 "0.33" 0 "0" 0 "0.75" 0 "0.33" 0 "1.0" 0 "0" 0 "0.75" 0 "0" 0 "0.5" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "26.85" 0 "0.0" 0 "1.0" 0 "1.0" 0 "0.0" 0 "1.0" 0 "1.0" 0 "0.0" 0 "0.0" 0 "3.0" 0 "1.11" 0 "26.85" 0 "1.0" 0>
  <R R4 1 380 380 -26 15 0 0 "100k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <C C1 1 240 380 -26 17 0 0 "47uF" 1 "" 0 "neutral" 0>
  <_BJT T2 1 440 300 8 -26 0 0 "npn" 1 "1e-16" 1 "1" 1 "1" 0 "0" 0 "0" 0 "0" 1 "0" 0 "0" 0 "1.5" 0 "0" 0 "2" 0 "100" 1 "1" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0.75" 0 "0.33" 0 "0" 0 "0.75" 0 "0.33" 0 "1.0" 0 "0" 0 "0.75" 0 "0" 0 "0.5" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "26.85" 0 "0.0" 0 "1.0" 0 "1.0" 0 "0.0" 0 "1.0" 0 "1.0" 0 "0.0" 0 "0.0" 0 "3.0" 0 "1.11" 0 "26.85" 0 "1.0" 0>
  <R R1 1 320 250 15 -26 0 1 "1k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <GND * 1 220 280 0 0 0 0>
  <GND * 1 320 600 0 0 0 0>
  <C C2 1 550 380 -26 17 0 0 "47uF" 1 "" 0 "neutral" 0>
  <R R3 1 620 440 15 -26 0 1 "10" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <GND * 1 620 470 0 0 0 0>
  <GND * 1 440 510 0 0 0 0>
  <GND * 1 150 470 0 0 0 0>
  <.DC DC1 1 30 180 0 34 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <Eqn Eqn1 1 60 540 -23 12 0 0 "Gain=dB(Output.v/Input.v)" 1 "Phase=phase(Output.v/Input.v)" 1 "yes" 0>
  <Vdc V2 1 220 250 18 -26 0 1 "9V" 1>
  <Vac V1 1 150 440 18 -26 0 1 "1V" 1 "1GHz" 0 "0" 0 "0" 0>
  <.AC AC1 1 30 240 0 34 0 0 "lin" 1 "1" 1 "1kHz" 1 "10001" 1 "no" 0>
</Components>
<Wires>
  <320 500 320 540 "" 0 0 0 "">
  <320 440 410 440 "" 0 0 0 "">
  <440 380 440 410 "" 0 0 0 "">
  <410 380 440 380 "" 0 0 0 "">
  <270 470 290 470 "" 0 0 0 "">
  <270 380 350 380 "" 0 0 0 "">
  <270 380 270 470 "" 0 0 0 "">
  <320 300 320 440 "" 0 0 0 "">
  <440 330 440 380 "" 0 0 0 "">
  <320 300 410 300 "" 0 0 0 "">
  <320 200 440 200 "" 0 0 0 "">
  <440 200 440 270 "" 0 0 0 "">
  <320 200 320 220 "" 0 0 0 "">
  <320 280 320 300 "" 0 0 0 "">
  <220 200 320 200 "" 0 0 0 "">
  <220 200 220 220 "" 0 0 0 "">
  <440 380 520 380 "" 0 0 0 "">
  <580 380 620 380 "" 0 0 0 "">
  <620 380 620 410 "" 0 0 0 "">
  <440 470 440 510 "" 0 0 0 "">
  <150 380 210 380 "Input" 100 350 6 "">
  <150 380 150 410 "" 0 0 0 "">
  <620 380 620 380 "Output" 630 350 0 "">
</Wires>
<Diagrams>
  <Rect 50 830 240 160 3 #c0c0c0 1 10 1 10 1 1000 1 -7.06106 0.5 -6.35345 1 -1 1 1 315 0 225 "" "" "">
	<"Gain" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 360 830 240 160 3 #c0c0c0 1 10 1 0 200 1000 1 -200 100 0 1 -1 1 1 315 0 225 "" "" "">
	<"Phase" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
