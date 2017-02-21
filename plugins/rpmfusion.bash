#!/bin/bash

install_rpmfusion ()
{
	if ! which dnf >/dev/null ; then
		echo "- rpmfusion can't be installed (dnf missing)"
		return 1
	fi

	local pkg_1="rpmfusion-free-release-$(rpm -E %fedora)"
	local pkg_2="rpmfusion-nonfree-release-$(rpm -E %fedora)"
	local url_1="https://download1.rpmfusion.org/free/fedora/$pkg_1.noarch.rpm"
	local url_2="https://download1.rpmfusion.org/nonfree/fedora/$pkg_2.noarch.rpm"

	if rpm -q $pkg_1 $pkg_2 >/dev/null ; then
		echo "+ rpmfusion installed already"
		return 0
	fi

	if sudo dnf install -y $url_1 $url_2 2> /dev/null ; then
		echo "+ rpmfusion installed"
	else
		echo "- rpmfusion not installed"
	fi
}
