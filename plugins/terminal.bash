#!/bin/bash

change_tilix_defaults ()
{
	# to store:
	# dconf dump /com/gexperts/Tilix/ > dotfiles/tilix.dconf

	dconf load /com/gexperts/Tilix/ < dotfiles/tilix.dconf

	echo "+ tilix settings loaded"
}
