# gnuplot script
set terminal epslatex color colortext
set autoscale
set border linewidth 2
set style line 1 linecolor rgb '#0060ad' linetype 1 linewidth 5
set style line 2 linecolor rgb '#dd181f' linetype 1 linewidth 5
#set border 31 linewidth .3
#unset log
unset label
#set log y
#set xrange [0:5]
#set yrange [0:5]
#set xtic auto
#set ytic auto
set title "$V_{in}$ vs. $V_{out}$"
#set xlabel "$V_S (V_{peak})$"
#set ylabel "$V_{DC} (V)$"
#set key top center

set output "data1.tex"
#set title "Peak Voltage vs. DC Voltage in Rectifier Circuit"
#set xlabel "$V_S (V_{peak})$"
#set ylabel "$V_{DC} (V)$"
plot 'data1.dat' using 1:2 title "$V_{in}$" with lines linestyle 1, 'data1.dat' using 1:3 title "$V_{out}$" with lines linestyle 2

set output "data2.tex"
#set title "Peak Voltage vs. DC Voltage in Rectifier Circuit"
#set xlabel "$V_S (V_{peak})$"
#set ylabel "$V_{DC} (V)$"
plot 'data2.dat' using 1:2 title "$V_{in}$" with lines linestyle 1, 'data2.dat' using 1:3 title "$V_{out}$" with lines linestyle 2

set output "data3.tex"
#set title "Peak Voltage vs. DC Voltage in Rectifier Circuit"
#set xlabel "$V_S (V_{peak})$"
#set ylabel "$V_{DC} (V)$"
plot 'data3.dat' using 1:2 title "$V_{in}$" with lines linestyle 1, 'data3.dat' using 1:3 title "$V_{out}$" with lines linestyle 2

set output "data4.tex"
#set title "Peak Voltage vs. DC Voltage in Rectifier Circuit"
#set xlabel "$V_S (V_{peak})$"
#set ylabel "$V_{DC} (V)$"
plot 'data4.dat' using 1:3 title "A = {Low}" with lines linestyle 1, 'data4.dat' using 1:4 title "A = {High}" with lines linestyle 2
