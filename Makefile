
# Simple Makefile to build Astran and wxSightGL

build:
	make -C Astran
	make -C wxSightGL
	cp -f wxSightGL/bin/wxsightGL Astran/build/Tools_Linux
	rm -r build

clean:
	make -C Astran clean
	make -C wxSightGL clean

clobber:
	make -C Astran clobber
	make -C wxSightGL clobber
