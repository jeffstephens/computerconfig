#!/bin/bash

if [ ! -f ~/.bash_aliases ]; then
  ln -s "$(pwd)"/bash_profile ~/.bash_aliases
else
  echo "Existing bash_aliases found - we won't touch it."
fi

if [ ! -f ~/.bash_profile_local ]; then
	touch ~/.bash_profile_local
	echo "# Put machine-specific commands in here" >> ~/.bash_profile_local
	echo "Created ~/.bash_profile_local for machine-specific commands"
fi
