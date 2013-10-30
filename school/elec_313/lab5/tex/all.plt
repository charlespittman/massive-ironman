# gnuplot script
set terminal epslatex color colortext
set autoscale

set style line 1 linecolor rgb '#0060ad' linetype 1 linewidth 5
set style line 2 linecolor rgb '#dd181f' linetype 1 linewidth 5
set style line 12 linecolor rgb '#808080' linetype 0 linewidth 1

set tics scale 1.5 nomirror
set border 3
set grid back linestyle 12

#set xrange [0:5]
#set yrange [0:5]

set format x "%.0s%cs"
set format y "%.0s%cV"

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
plot 'data4.dat' using 1:3 title "$V_{out}$ (A = {Low})" with lines linestyle 1, 'data4.dat' using 1:4 title "$V_{out}$ (A = {High})" with lines linestyle 2
