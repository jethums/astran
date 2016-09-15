
# Simple Makefile to build Astran and wxSightGL

ASTRAN_CFG = astran.cfg

build:
	make -C Astran
	make -C wxSightGL
	cp -f wxSightGL/build/bin/wxsightgl Astran/build/Tools_Linux/wxSightGL
	make fix-astran.cfg

clean:
	make -C Astran clean
	make -C wxSightGL clean
	rm -rf Astran/build/Tools_Linux/wxSightGL
	rm -rf astran.cfg
	rm -rf wxSightGL/build/


clobber:
	make -C Astran clobber
	make -C wxSightGL clobber


fix-astran.cfg:
	@ cp Astran/build/bin/astran.cfg $(ASTRAN_CFG)
	@ sed -i "s|viewer.*|viewer $(shell pwd)/Astran/build/Tools_Linux/wxSightGL|g" $(ASTRAN_CFG)
	@ sed -i "s|lpsolve.*|lpsolve $(GUROBI_HOME)/bin/gurobi_cl|g" $(ASTRAN_CFG)
	@ sed -i "s|rotdl.*|rotdl $(shell pwd)/Astran/build/Tools_Linux/rotdl|g" $(ASTRAN_CFG)
	@ sed -i "s|placer.*|placer $(shell pwd)/Astran/build/Tools_Linux/mobralplace|g" $(ASTRAN_CFG)
