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
    cp -p ${MY_HOME}/.bash_profile ${MY_HOME}/.bash_profile.PRE_DOTFILES
    /bin/ln -nsf .bash_profile ${MY_HOME}/git/dotfiles/files/bash/init.bash 
    /bin/ln -nsf $$file ${MY_HOME}/git/dotfiles/files ; \

    OS := $(shell uname)
    ifeq $(OS) Darwin
    # Run MacOS-init.sh
    else
    # Run Linux-init.sh
    endif

clean:
    # remove the links
    rm -f ${MY_HOME}/.bash_profile
    rm -f ${MY_HOME}/bin
    # restore any backups previously created
    cp -p ${MY_HOME}/.bash_profile ${MY_HOME}/.bash_profile.PRE_DOTFILES

.PHONY: install clean