<Qucs Schematic 0.0.17>
<Properties>
  <View=-60,-40,990,1064,1.06231,0,146>
  <Grid=10,10,1>
  <DataSet=7.13.dat>
  <DataDisplay=7.13.dpl>
  <OpenDisplay=0>
  <Script=7.13.m>
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
  <GND * 1 410 300 0 0 0 0>
  <C Cp 1 480 270 17 -26 0 1 "0.1uF" 1 "" 0 "neutral" 0>
  <GND * 1 480 300 0 0 0 0>
  <C Cs 1 360 200 -26 17 0 0 "0.1uF" 1 "" 0 "neutral" 0>
  <R Rs 1 300 200 -26 15 0 0 "1k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <GND * 1 230 300 0 0 0 0>
  <R Rp 1 410 270 15 -26 0 1 "10k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <Vac Vi 1 230 270 18 -26 0 1 "1 V" 1 "1 GHz" 0 "0" 0 "0" 0>
  <.DC DC1 1 0 180 0 34 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <.AC AC1 1 0 250 0 34 0 0 "log" 1 "1 Hz" 1 "1 MHz" 1 "601" 1 "no" 0>
  <Eqn Eqn1 1 600 180 -23 12 0 0 "Gain=dB(Output.v/Input.v)" 1 "Phase=phase(Output.v/Input.v)" 1 "yes" 0>
  <Eqn Eqn2 1 600 270 -23 14 0 0 "MAXgain=max(Gain)" 1 "RMS=rms(MAXgain)" 1 "RMSfreq=xvalue(Gain,rms(MAXgain))" 1 "yes" 0>
</Components>
<Wires>
  <480 200 480 240 "" 0 0 0 "">
  <230 200 270 200 "" 0 0 0 "">
  <230 200 230 240 "" 0 0 0 "">
  <390 200 410 200 "" 0 0 0 "">
  <410 200 480 200 "" 0 0 0 "">
  <410 200 410 240 "" 0 0 0 "">
  <480 200 480 200 "Output" 510 170 0 "">
  <230 200 230 200 "Input" 180 170 0 "">
</Wires>
<Diagrams>
  <Rect 20 644 514 264 3 #c0c0c0 1 10 1 1 1 1e+06 1 -63.9156 10 0 1 -1 0.5 1 315 0 225 "Frequency (Hz)" "Gain (dB)" "">
	<"Gain" #0000ff 0 3 0 0 0>
	  <Mkr 489.779 289 -297 3 0 0>
	<"MAXgain" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect 20 926 518 236 3 #c0c0c0 1 10 1 1 1 100000 0 -90 30 90 1 -1 0.5 1 315 0 225 "Frequency (Hz)" "Phase (°)" "">
	<"Phase" #0000ff 0 3 0 0 0>
  </Rect>
  <Tab 570 434 198 49 3 #c0c0c0 1 00 1 0 1 1 1 0 1 1 1 0 1 1 315 0 225 "" "" "">
	<"MAXgain" #0000ff 0 3 0 0 0>
	<"RMS" #0000ff 0 3 0 0 0>
	<"RMSfreq" #0000ff 0 3 1 0 0>
  </Tab>
</Diagrams>
<Paintings>
</Paintings>
