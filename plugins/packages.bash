#!/bin/bash

list_file ()
{
	cat $1 | sed -e 's/\(#.*\)//'
}

install_packages ()
{
	if ! which dnf >/dev/null ; then
		echo "- packages can't be installed (dnf missing)"
		return 1
	fi

	if rpm -q $(list_file $1) > /dev/null ; then
		echo "+ all packages installed already"
		return 0
	fi

	if sudo dnf install --skip-broken -y $(list_file $1) ; then
		echo "+ $1 packages installed"
		rpm -q $(list_file $1) | grep -e "is not installed"
		return 0
	else
		echo "- $1 packages not installed"
		return 1
	fi
}
