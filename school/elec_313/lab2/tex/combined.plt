# gnuplot script
set terminal latex
set output "combined.tex"
set autoscale
set border 31 linewidth .3
unset log
unset label
#set log y
set xrange [0:0.75]
#set yrange [0:]
set xtic auto
set ytic auto
set title "Diode Current vs. Voltage"
set xlabel "$V_d$ (V)"
set ylabel "$I_d$\\\\(mA)"
set key top left box
plot 'part_a.dat' using 2:3 title "Part A", \
     'part_b.dat' using 2:3 title "Part B"