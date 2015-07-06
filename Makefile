# Do not run this file. Run the Makefile in the egoboo source directory, instead

#!!!! do not specify the prefix in this file
#!!!! if you want to specify a prefix, do it on the command line
#For instance: "make PREFIX=$HOME/.local"

ifndef ($(PREFIX),"")
	#!!!! error the PREFIX is not defined. The install will not work properly
endif

.PHONY: install uninstall

install:
ifeq ($(PREFIX),)
	$(error PREFIX is empty, will not install)
endif
ifeq ($(PROJ_NAME),)
	$(error PROJ_NAME is empty, will not install)
endif

	######################################
	# Thank you for installing the data files for egoboo! 
	#
	# If you do not have root access on this machine, 
	# you can specify a prefix on the command line: 
	#     "make install PREFIX=$$HOME/.local"
	# where the environment variable PREFIX specifies a
	# virtual root for your installation. In this example,
	# it is a local installation for this username only.
	#

#	copy the data to the games folder
	mkdir -p ${PREFIX}/share/games/${PROJ_NAME}
	cp -rdf ./basicdat ${PREFIX}/share/games/${PROJ_NAME}
	cp -rdf ./modules ${PREFIX}/share/games/${PROJ_NAME}
	cp -rdf ./editor ${PREFIX}/share/games/${PROJ_NAME}

#	copy the basic configuration files to the config directory
	mkdir -p ${PREFIX}/etc/${PROJ_NAME}
	cp -rdf ./setup.txt ${PREFIX}/etc/${PROJ_NAME}/setup.txt
	cp -rdf ./controls.txt ${PREFIX}/etc/${PROJ_NAME}/controls.txt

	#####################################
	# Installation of the egoboo data files has completed
	#####################################

uninstall:
ifeq ($(PREFIX),)
	$(error PREFIX is empty, will not uninstall)
endif
ifeq ($(PROJ_NAME),)
	$(error PROJ_NAME is empty, will not uninstall)
endif

	rm -r ${PREFIX}/share/games/${PROJ_NAME}/ ${PREFIX}/etc/${PROJ_NAME}/
