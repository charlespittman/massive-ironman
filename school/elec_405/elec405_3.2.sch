<Qucs Schematic 0.0.17>
<Properties>
  <View=10,162,551,729,1.80776,0,0>
  <Grid=10,10,1>
  <DataSet=elec405_3.2.dat>
  <DataDisplay=elec405_3.2.dpl>
  <OpenDisplay=0>
  <Script=elec405_3.2.m>
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
  <L L1 1 300 460 10 -26 0 1 "100 mH" 1 "" 0>
  <IProbe Pr1 1 190 250 -26 16 0 0>
  <GND * 1 300 490 0 0 0 0>
  <R R1 1 360 300 15 -26 0 1 "1k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <R R2 1 300 400 15 -26 0 1 "5k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <C C1 1 260 300 17 -26 0 1 "1 uF" 1 "" 0 "neutral" 0>
  <GND * 1 120 350 0 0 0 0>
  <Vac V1 1 120 320 18 -26 0 1 "1 V" 1 "100 kHz" 1 "0" 0 "0" 0>
  <.DC DC1 1 60 400 0 36 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <.AC AC1 1 60 470 0 36 0 0 "lin" 1 "100kHz" 1 "100kHz" 1 "19" 1 "no" 0>
  <Eqn Eqn1 1 80 620 -23 14 0 0 "Z=Vout.v / Pr1.i" 1 "Zmag=mag(Z)" 1 "Zphase=phase(Z)" 1 "yes" 0>
</Components>
<Wires>
  <300 350 300 370 "" 0 0 0 "">
  <300 350 360 350 "" 0 0 0 "">
  <360 330 360 350 "" 0 0 0 "">
  <260 350 300 350 "" 0 0 0 "">
  <260 330 260 350 "" 0 0 0 "">
  <260 250 260 270 "" 0 0 0 "">
  <260 250 360 250 "Vout" 360 220 69 "">
  <360 250 360 270 "" 0 0 0 "">
  <220 250 260 250 "" 0 0 0 "">
  <120 250 160 250 "" 0 0 0 "">
  <120 250 120 290 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Tab 210 586 301 49 3 #c0c0c0 1 00 1 0 1 1 1 0 1 1 1 0 1 19 315 0 225 "" "" "">
	<"Z" #0000ff 0 3 1 0 0>
  </Tab>
</Diagrams>
<Paintings>
</Paintings>
