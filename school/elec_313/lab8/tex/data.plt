# gnuplot script
set terminal epslatex color colortext
set autoscale

#set style line 1 linecolor rgb '#0060ad' linetype 1 linewidth 5
#set style line 2 linecolor rgb '#dd181f' linetype 1 linewidth 5
set style line 12 linecolor rgb '#808080' linetype 0 linewidth 1

set tics scale 1.5 nomirror
set border 3
set grid back linestyle 12

#set xrange [0:5]
#set yrange [0.5:2.5]

#set log x

set key top left
set format x "%.0s%cV"
set format y "%.0smA"

set output "graph.tex"
#set title "Peak Voltage vs. DC Voltage in Rectifier Circuit"
#set xlabel "$V_{in}$"
#set ylabel "Gain"
plot 'data.dat' using 3:2 title "$I_B$ = 20 uA" with linespoints, \
     'data.dat' using 5:4 title "$I_B$ = 50 uA" with linespoints, \
     'data.dat' using 7:6 title "$I_B$ = 80 uA" with linespoints, \
     'data.dat' using 9:8 title "$I_B$ = 100 uA" with linespoints