
svg = $(wildcard *.svg)
xpm = $(svg:.svg=.xpm)

all: $(xpm)

%.xpm: %.svg
	inkscape -z -e $(@:.xpm=.png) -w 22 -h 22  $^ > /dev/null
	convert $(@:.xpm=.png) $@
	# fix xpm as wxformbuilder needs
	sed -i "s/static char/char const/g" $@
	sed -i "s/$(@:.xpm=)/$(@:.xpm=_xpm)/g" $@
	rm -rf $(@:.xpm=.png)

clean:
	@ rm -f $(xpm)
