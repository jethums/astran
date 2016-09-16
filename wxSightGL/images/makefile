
svg = $(wildcard *.svg)
h = $(svg:.svg=.h)

all: $(h)

%.h: %.svg
	inkscape -z -e $(@:.h=.png) -w 22 -h 22  $^ > /dev/null
	convert $(@:.h=.png) $@
	./bin2c.pl $(@:.h=.png)
	mv $(@) $(@:.h=_img.h)
	# sed -i "s/static char/char const/g" $@
	rm -rf $(@:.xpm=.png)

clean:
	@ rm -f *.png
	@ rm -f *.h
