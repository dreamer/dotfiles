#!/bin/bash

link_dropbox () {

	local object=$1
	local target=$2
	local target_desc=${2/$HOME/\~}

	if [ ! -e "$object" ] ; then
		echo "- $target_desc not created ($object doesn't exist)"
		return 1
	fi

	local link="$(readlink $target)"

	if [ "$link" = "$object" ] ; then
		echo "+ $target_desc linked already"
		return 0
	fi

	if [ -d "$target" ] ; then
		if ! rmdir "$target" 2> /dev/null ; then
			echo "- $target_desc not linked (can't be replaced)"
			return 1
		fi
	fi

	if ln -s "$object" "$target" ; then
		echo "+ $target_desc linked"
	else
		echo "- linking $target_desc failed"
	fi
}
