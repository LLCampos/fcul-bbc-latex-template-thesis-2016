
      set   autoscale                        # scale axes automatically
      unset log                              # remove any log-scaling
      unset label                            # remove any previous labels
      set xtic auto                          # set xtics automatically
      set ytic 2                          # set ytics automatically


set style function linespoints

set bmargin  6
unset colorbox



set xlabel "Year"
set xrange [1965:2012]

set ylabel "Number of Citations (millions)"
set yrange [0:20]

set terminal postscript eps enhanced monochrome dashed
set output 'pubmedgrowth.eps'

plot 'pubmedgrowth.dat' using 1:7 pt 6 with linespoints notitle




         
set xlabel "Year"
set xrange [1965:2012]

set ylabel "Number of Substances (millions)"
set yrange [0:70]
set ytic 5 

set terminal postscript eps enhanced monochrome dashed
set output 'casgrowth.eps'

plot 'casgrowth.dat' using 1:5 pt 6 with linespoints notitle



