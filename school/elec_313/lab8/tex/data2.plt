# gnuplot script
set terminal epslatex color colortext

set autoscale
#set style line 1 linecolor rgb '#0060ad' linetype 1 linewidth 5
#set style line 2 linecolor rgb '#dd181f' linetype 1 linewidth 5
set style line 12 linecolor rgb '#808080' linetype 0 linewidth 1

set tics scale 1.5 nomirror
set border 3
#set grid back linestyle 12
#unset grid
set xrange [3:]
#set yrange [0.5:2.5]

#set log x

set key top left
set format x "%.0s%cV"
set format y "%.0smA"

f(x) = m*x + a
g(x) = n*x + b
h(x) = o*x + c
i(x) = p*x + d
fit f(x) './data.dat' u 3:2 via m,a
fit g(x) './data.dat' u 5:4 via n,b
fit h(x) './data.dat' u 7:6 via o,c
fit i(x) './data.dat' u 9:8 via p,d

set output "graph2.tex"
#set title "Peak Voltage vs. DC Voltage in Rectifier Circuit"
#set xlabel "$V_{in}$"
#set ylabel "Gain"
plot 'data.dat' using 3:2 title "$I_B$ = 20 uA" with points, f(x) lt 0 lw 3 title "", \
     'data.dat' using 5:4 title "$I_B$ = 50 uA" with points, g(x) lt 0 lw 3 title "", \
     'data.dat' using 7:6 title "$I_B$ = 80 uA" with points, h(x) lt 0 lw 3 title "", \
     'data.dat' using 9:8 title "$I_B$ = 100 uA" with points, i(x) lt 0 lw 3 title ""