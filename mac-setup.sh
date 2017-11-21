#!/bin/bash

if [ ! -f ~/.ssh/config ]; then
	echo "Creating basic SSH config file..."
	cp ssh-config ~/.ssh/config
else
	echo "Existing SSH config file found - we won't touch it."
fi

if [ ! -f ~/.bash_profile ]; then
	echo "Symlinking bash_profile..."
	ln -s "$(pwd)"/bash_profile ~/.bash_profile
	. ~/.bash_profile
else
	echo "Existing bash_profile found - we won't touch it."
fi

if [ ! -f ~/.bash_profile_local ]; then
	touch ~/.bash_profile_local
	echo "# Put machine-specific commands and environment variables here" >> ~/.bash_profile_local
	echo "Created ~/.bash_profile_local for machine-specific commands"
fi

# this might also work on Linux, but that hasn't been tested so it's here
if [ -d ~/.atom ]; then
	mkdir -p ~/.atom-backup
	cp -r ~/.atom/* ~/.atom-backup

	echo "Previous Atom files have been moved to ~/.atom-backup"

	rm -rf ~/.atom/packages
	rm ~/.atom/config.cson
	rm ~/.atom/github.cson
	rm ~/.atom/keymap.cson
	rm ~/.atom/snippets.cson

	ln -s "$(pwd)"/atom/packages ~/.atom/packages
	ln -s "$(pwd)"/atom/config.cson ~/.atom/config.cson
	ln -s "$(pwd)"/atom/github.cson ~/.atom/github.cson
	ln -s "$(pwd)"/atom/keymap.cson ~/.atom/keymap.cson
	ln -s "$(pwd)"/atom/snippets.cson ~/.atom/snippets.cson

	echo "Atom configuration has been symlinked to this directory"
fi

echo "Installing fonts..."
cp fonts/* /Library/Fonts/
