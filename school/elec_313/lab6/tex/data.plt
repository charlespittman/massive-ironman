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

set format x "%.0s%cV"
set format y "%.0smA"

set output "graph.tex"
#set title "Peak Voltage vs. DC Voltage in Rectifier Circuit"
set xlabel "$V_{DS}$"
set ylabel "$I_D$"
plot 'data.dat' using 1:2 title "$V_{GS}$ = 2.11" with linespoints, \
     'data.dat' using 1:3 title "$V_{GS}$ = 2.31" with linespoints, \
     'data.dat' using 1:4 title "$V_{GS}$ = 2.51" with linespoints, \
     'data.dat' using 1:5 title "$V_{GS}$ = 2.71" with linespoints, \
     'data.dat' using 1:6 title "$V_{GS}$ = 2.91" with linespoints
