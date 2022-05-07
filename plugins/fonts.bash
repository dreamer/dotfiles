#!/bin/bash

download_fonts () {

	mkdir -p ~/.local/share/fonts

	# Microsoft Core Fonts

	local arial=~/.local/share/fonts/arial.ttf
	if [ ! -f "$arial" ] ; then
		winetricks corefonts
		cp ~/.wine/drive_c/windows/Fonts/*.ttf ~/.local/share/fonts
	fi

	fc-cache -f

	echo "+ fc-cache updated"
}
