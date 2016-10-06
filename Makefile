
# Simple Makefile to build Astran and SightGL at once

all: astran sightgl

astran:
	mkdir -p build/astran
	cd build/astran; cmake ../../Astran
	make -C build/astran

sightgl:
	mkdir -p build/sightgl
	cd build/sightgl; cmake ../../SightGL
	make -C build/sightgl

astran-config:
	@ cp -f build/sightgl/SightGL build/astran/build/bin
	@ cp Astran/build/bin/astran.cfg astran.cfg
	@ sed -i "s|viewer.*|viewer $(shell pwd)/Astran/build/Tools_Linux/wxSightGL|g" astran.cfg
	@ sed -i "s|lpsolve.*|lpsolve $(GUROBI_HOME)/bin/gurobi_cl|g" astran.cfg
	@ sed -i "s|rotdl.*|rotdl $(shell pwd)/Astran/build/Tools_Linux/rotdl|g" astran.cfg
	@ sed -i "s|placer.*|placer $(shell pwd)/Astran/build/Tools_Linux/mobralplace|g" astran.cfg

	# make fix-astran.cfg


clean:
	rm -rf build