
svg = $(wildcard *.svg)
png = $(svg:.svg=.png)

all: $(png)

%.png: %.svg
	inkscape -z -e $@ -w 16 -h 16  $^ > /dev/null
	./bin2c.pl $@

clean:
	@ rm -f *.h
	@ rm -f $(png)
