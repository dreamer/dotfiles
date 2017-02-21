#!/bin/bash

change_gnome_defaults ()
{
	gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Alt>'

	echo "+ gnome settings updated"
}
