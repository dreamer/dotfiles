#!/bin/bash

change_tilix_defaults ()
{
	dconf load /com/gexperts/Tilix/ < dotfiles/tilix.dconf

	echo "+ tilix settings loaded"
}
