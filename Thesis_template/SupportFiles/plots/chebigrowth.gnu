
      set   autoscale                        # scale axes automatically
      unset log                              # remove any log-scaling
      unset label                            # remove any previous labels
      set xtic auto                          # set xtics automatically
      set ytic 2                          # set ytics automatically


set style function linespoints

set bmargin  6
unset colorbox



set xlabel "Year"
set xrange [2004:2013]

set ylabel "Annotated entities (thousands)"
set yrange [0:32]

set terminal postscript eps enhanced monochrome dashed
set output 'chebigrowth.eps'

plot 'chebigrowth.dat' using 1:3 pt 6 with linespoints notitle




