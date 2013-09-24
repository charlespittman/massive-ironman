# gnuplot script
set terminal latex
set output "part_b.tex"
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
set ylabel "$I_d$\\\\(mA)"
plot 'part_b.dat' using 2:3 title "" with linespoints