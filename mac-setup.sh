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

echo "Installing fonts..."
cp fonts/* /Library/Fonts/
