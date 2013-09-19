# gnuplot script
#set terminal latex
#set output "part_a.tex"
set autoscale
set border 31 linewidth .3
unset log
unset label
#set log y
set xrange [0:1]
set xtic auto
set ytic auto
set title "Diode Current vs. Voltage"
set xlabel "Diode Voltage $V_d$ (V)"
set ylabel "Diode Current $I_d$ (mA)"
plot 'part_a.dat' using 2:3 title ""  with linespoints