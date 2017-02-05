#!/bin/bash

install_vimrc ()
{
	# before vundle configuration, you need to
	# check if github can be reached!
	# otherwise vundle will fail to download plugins

	if [ -d ~/.vim ] ; then
		echo "+ .vim is created already"
	else
		git clone \
			https://github.com/VundleVim/Vundle.vim.git \
			~/.vim/bundle/Vundle.vim

		echo "+ .vim created, Vundle installed"
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

	vim +PluginInstall +qall
	echo "+ Vundle plugins installed"
}
