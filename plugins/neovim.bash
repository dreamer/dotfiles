#!/bin/bash

nvim::install_plug () {
	curl \
		-fLo ~/.local/share/nvim/site/autoload/plug.vim \
		--silent \
		--create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_nvimrc () {

	if ! which nvim >/dev/null ; then
		echo "- nvim missing"
		return 1
	fi

	# download plug directly from github

	if [ -f ~/.local/share/nvim/site/autoload/plug.vim ] ; then
		echo "+ nvim plug is installed already"
	else
		if nvim::install_plug ; then
			echo "+ nvim plug installed"
		else
			echo "- nvim plug download failed"
			return 1
		fi
	fi

	local object="$(pwd)/dotfiles/nvim.init.vim"
	local target=~/.config/nvim/init.vim
	local target_desc=${target/$HOME/\~}

	local link="$(readlink $target)"

	if [ "$link" = "$object" ] ; then
		echo "+ $target_desc linked already"
		return 0
	fi

	if [ -f "$target" ] ; then
		echo "- $target_desc seems to be created (different one)"
		return 1
	fi

	mkdir -p "$(dirname $target)"

	if ln -s "$object" "$target" ; then
		echo "+ $target_desc linked"
	else
		echo "- #target_desc linking failed"
		return 1
	fi

	nvim +PlugInstall +UpdateRemotePlugins +qall
	echo "+ nvim plugins installed"
}
