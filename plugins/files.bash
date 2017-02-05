#!/bin/bash

link_file ()
{
	local object=$1
	local target=$2

	if [ ! -e "$object" ] ; then
		echo "- $target not created ($object doesn't exist)"
		return 1
	fi

	local link="$(readlink $target)"

	if [ "$link" = "$object" ] ; then
		echo "+ $target linked already"
		return 0
	fi

	if [ -f "$target" ] ; then
		echo "- $target can't be linked (exists already)"
		return 1
	fi

	mkdir -p $(dirname $target)

	if ln -s "$object" "$target" ; then
		echo "+ $target linked"
	else
		echo "- linking $target failed"
	fi
}
