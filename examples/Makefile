CCFLAGS := '-Wfatal-errors -O3 -mfpmath=sse -msse -msse2 -msse3 -ffast-math'

plot :
	install -d plotdir
	$(MAKE) DEST='plotdir/' ARCH='plot.cpp'  CXXFLAGS=$(CCFLAGS) -f Makefile.compile

alsagtk :
	install -d alsagtkdir
	$(MAKE) DEST='alsagtkdir/' ARCH='alsa-gtk.cpp' LIB='-lpthread -lasound  `pkg-config --cflags --libs gtk+-2.0` $(OSCLIB) $(HTTPDLIB)'  CXXFLAGS=$(MYGCCFLAGS) -f Makefile.compile

exemplo1:
	./plotdir/square -cyclicratio 0.5 -n 44100 -period 100 > /tmp/square.txt
	gnuplot -e "set xrange [0:44100]; set yrange [-2:2]; plot '/tmp/square.txt' with linespoints; pause 120"

exemplo2:
	./plotdir/sineosc -freq 440 -n 44100 -volume 1 > /tmp/sineosc.txt
	gnuplot -e "set xrange [0:500]; set yrange [-2:2]; plot '/tmp/sineosc.txt' with linespoints; pause 120"

clean:
	rm -rd *dir/
