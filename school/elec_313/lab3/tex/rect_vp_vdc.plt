# gnuplot script
set terminal latex
set output "rect_vp_vdc.tex"
set autoscale
set border 31 linewidth .3
unset log
unset label
#set log y
#set xrange [0:5]
#set yrange [0:5]
set xtic auto
set ytic auto
set title "Peak Voltage vs. DC Voltage in Rectifier Circuit"
set xlabel "$V_S (V_{peak})$"
set ylabel "$V_{DC} (V)"
#set key top center
plot 'rect_vp_vdc.dat' using 1:5 title "" with linespoints
