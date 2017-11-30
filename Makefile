# ~/git/dotfiles/Makefile
#
# - link the startup file to the location in the git repo
# - link important directories to their git original
# - start any local initialisation script, based on OS type; Linux or MacOS
#


# List out all dotfiles except .git so that we can iteratively copy them.
DOTFILES != find . -maxdepth 1 -name '.[^.]*' ! -name '.git'
MY_HOME := $$HOME

default: help

help:
	@echo "usage:"
	@echo "  install"
	@echo "  clean"

install:
	@cp -p ${MY_HOME}/.bash_profile ${MY_HOME}/.bash_profile.PRE_DOTFILES
	@/bin/ln -nsf ${MY_HOME}/git/dotfiles/files/bash/init.sh ${MY_HOME}/.bash_profile
	@/bin/ln -nsf ${MY_HOME}/git/dotfiles/files/bash ${MY_HOME}/.bash
	@/bin/ln -nsf ${MY_HOME}/git/dotfiles/files/bin ${MY_HOME}/bin

	@OS := $(shell uname)
	ifeq $(OS) Darwin
	# Run MacOS-init.sh
	echo "Darwin"
	else
	# Run Linux-init.sh
	echo "Darwin"
	endif

clean:
    # remove the links
	rm -f ${MY_HOME}/.bash_profile
	rm -f ${MY_HOME}/.bash
	rm -f ${MY_HOME}/bin
    # restore any backups previously created
	mv -f ${MY_HOME}/.bash_profile.PRE_DOTFILES ${MY_HOME}/.bash_profile

.PHONY: install clean