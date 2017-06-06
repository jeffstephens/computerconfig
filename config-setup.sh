#!/bin/bash
packageControlPath=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
preferencesPath=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

echo $packageControlPath

# back existing files up if they exist
for oldFile in "$packageControlPath" "$preferencesPath"; do
	if [ -f "$oldFile" ]; then
		mv "$oldFile" "$oldFile.bak"
		echo "Backed up existing configuration file at $oldFile.bak"
	fi
done

echo "Symlinking Sublime Text preferences and package list..."
ln -s "$(pwd)"/sublime-text/Package\ Control.sublime-settings "$packageControlPath"
ln -s "$(pwd)"/sublime-text/Preferences.sublime-settings "$preferencesPath"
