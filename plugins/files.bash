#!/bin/bash

link_file () {

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

	if [ -f "$target" ] ; then
		echo "- $target_desc can't be linked (exists already)"
		return 1
	fi

	mkdir -p $(dirname $target)

	if ln -s "$object" "$target" ; then
		echo "+ $target_desc linked"
	else
		echo "- linking $target_desc failed"
	fi
}

force_link_file () {

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

	if [ -f "$target" ] ; then
		rm $target
	fi

	mkdir -p $(dirname $target)

	if ln -s "$object" "$target" ; then
		echo "+ $target_desc linked"
	else
		echo "- linking $target_desc failed"
	fi
}
