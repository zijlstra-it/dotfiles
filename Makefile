# ~/git/dotfiles/Makefile
#
# - link the startup file to the location in the git repo
# - link important directories to their git original
# - start any local initialisation script, based on OS type; Linux or MacOS
#
DOTFILES = 'gitignore gitconfig vimrc screenrc'
MY_HOME := $$HOME

default: help

help:
	@echo "usage:"
	@echo "  install"
	@echo "  clean"

install:
	@/bin/ln -nsf ${MY_HOME}/git/dotfiles/files/bash/init.sh ${MY_HOME}/.bash_profile
	@/bin/ln -nsf ${MY_HOME}/git/dotfiles/files/bash ${MY_HOME}/.bash
	@/bin/ln -nsf ${MY_HOME}/git/dotfiles/files/bin ${MY_HOME}/bin

#	@for file in ${DOTFILES} ; do \
#		@/bin/ln -nsf ${MY_HOME}/git/dotfiles/files/dotfiles/${file} ${MY_HOME}/.${file}
#	done

	@OS := $(shell uname)
	ifeq $(OS) Darwin
	# Run MacOS-init.sh
	echo "Darwin"
	else
	# Run Linux-init.sh
	echo "Linux"
	endif

clean:
	# remove the links
	rm -f ${MY_HOME}/.bash_profile
	rm -f ${MY_HOME}/.bash
	rm -f ${MY_HOME}/bin

	@for file in ${DOTFILES} ; do \
		rm -r ${MY_HOME}/.${file}
	done

.PHONY: install clean
