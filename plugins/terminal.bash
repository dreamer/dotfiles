#!/bin/bash

change_tilix_defaults ()
{
	dconf load /com/gexperts/Tilix/ < dotfiles/tilix.conf

	echo "+ tilix settings loaded"
}
