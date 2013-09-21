# gnuplot script
set terminal latex
set output "part_a.tex"
set autoscale
set border 31 linewidth .3
unset log
unset label
#set log y
set xrange [0:0.75]
set xtic auto
set ytic auto
set title "Diode Current vs. Voltage"
set xlabel "$V_d$ (V)"
set ylabel "$I_d$ (mA)"
plot 'part_a.dat' using 2:3 title "" with linespoints, 'part_a.dat' using 2:4