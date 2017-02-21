#!/bin/bash

install_vimrc ()
{
	if ! which vim >/dev/null ; then
		echo "- Vundle can't be installed (vim missing)"
		return 1
	fi

	# before vundle configuration, you need to
	# check if github can be reached!
	# otherwise vundle will fail to download plugins

	if [ -d ~/.vim ] ; then
		echo "+ .vim is created already"
	else
		if git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim ; then
			echo "+ .vim created, Vundle installed"
		else
			echo "- .vim creation failed"
			rmdir ~/.vim/bundle
			rmdir ~/.vim
			return 1
		fi
	fi

	local object="$(pwd)/dotfiles/vimrc"
	local target=~/.vimrc

	local link="$(readlink $target)"

	if [ "$link" = "$object" ] ; then
		echo "+ $target linked already"
		return 0
	fi

	if [ -f ~/.vimrc ] ; then
		echo "- .vimrc seems to be created (different one)"
		return 1
	fi

	if ln -s "$object" "$target" ; then
		echo "+ .vimrc linked"
	else
		echo "- .vimrc linking failed"
		return 1
	fi

	# TODO: create plugin specific vimrc file
	# use it here with -u <vimrcfile>
	# and :source it from main .vimrc

	vim +PluginInstall +qall
	echo "+ Vundle plugins installed"
}
