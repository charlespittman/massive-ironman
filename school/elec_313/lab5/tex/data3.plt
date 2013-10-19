# gnuplot script
set terminal epslatex color
set output "data3.tex"
set autoscale
set border 31 linewidth .3
#unset log
#unset label
#set log y
#set xrange [0:5]
#set yrange [0:5]
#set xtic auto
#set ytic auto
#set title "Peak Voltage vs. DC Voltage in Rectifier Circuit"
#set xlabel "$V_S (V_{peak})$"
#set ylabel "$V_{DC} (V)$"
#set key top center
plot 'data3.dat' using 1:2 title "$V_{in}$", 'data3.dat' using 1:3 title "$V_{out}$"
