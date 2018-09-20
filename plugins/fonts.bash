#!/bin/bash

download_fonts () {

	mkdir -p ~/.local/share/fonts

	# FiraCode

	for type in Bold Light Medium Regular Retina; do
		local file=~/.local/share/fonts/FiraCode-${type}.ttf
		if [ -f "$file" ] ; then
			continue
		fi
		wget -O "$file" "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true";
	done

	# Microsoft Core Fonts

	local arial=~/.local/share/fonts/arial.ttf
	if [ ! -f "$arial" ] ; then
		winetricks corefonts
		cp ~/.wine/drive_c/windows/Fonts/*.ttf ~/.local/share/fonts
	fi

	fc-cache -f

	echo "+ fc-cache updated"
}
