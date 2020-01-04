# ~/git/dotfiles/Makefile
#
# - link the startup file to the location in the git repo
# - link important directories to their git original
# - start any local initialisation script, based on OS type; Linux or MacOS
#


# List out all dotfiles except .git so that we can iteratively copy them.
#DOTFILES != find ./files/dotfiles -maxdepth 1 -name '.[^.]*' ! -name '.git'
DOTFILES := $(shell find ./files/dotfiles -maxdepth 1 -name '.[^.]*' ! -name '.git')
MY_HOME := $$HOME
OS_NAME := $(shell uname)

default: help

help:
    @echo "usage:"
    @echo "  install"
    @echo "  setup: Run OS specific init script"
    @echo "  udpate: Copy dotfiles back to git/dotfiles/files/dotfiles for committing"
    @echo "  clean: remove the linked files"

install:
    @/bin/ln -nsf ${MY_HOME}/git/dotfiles/files/bash/init.sh ${MY_HOME}/.bash_profile
    @/bin/ln -nsf ${MY_HOME}/git/dotfiles/files/bash ${MY_HOME}/.bash
    @/bin/ln -nsf ${MY_HOME}/git/dotfiles/files/bin ${MY_HOME}/bin

    @for file in $(DOTFILES) ; do \
        cp -pPR $$file ${MY_HOME} ; \
    done

    @echo "Shell files and links created, run \"make setup\" for updating the system settings"

setup:
ifeq ($(OS_NAME),Darwin)
    @echo "Running MacOS-init.sh"
    ~/git/dotfiles/files/bin/macOS-init.sh
else
ifeq ($(OS_NAME),Linux)
    @echo "Running Linux-init.sh"
endif
endif

update:
    @for file in $(DOTFILES) ; do \
        cp -pPR $$file ${MY_HOME}/git/dotfiles/files/dotfiles/ ; \
    done

clean:
# remove the links
    rm -f ${MY_HOME}/.bash_profile
    rm -f ${MY_HOME}/.bash
    rm -f ${MY_HOME}/bin

.PHONY: install clean
