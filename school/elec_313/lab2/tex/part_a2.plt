# gnuplot script
set terminal latex
set output "part_a2.tex"
set autoscale
set border 31 linewidth .3
unset log
unset label
#set log y
set xrange [0:]
set yrange [0:]
set xtic auto
set ytic auto
set title "Diode Natural Logarithm of Current vs. Voltage"
set xlabel "$V_d$ (V)"
set ylabel "ln($I_d$)\\\\(mA)"
plot 'part_a.dat' using 2:(log($3)) title ""