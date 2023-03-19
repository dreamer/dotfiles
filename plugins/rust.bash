#!/bin/bash

rustup::install_toolchain ()
{
	curl \
		--proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- \
		--no-modify-path -y
}

install_rust_toolchain ()
{
	if which rustc 2>/dev/null ; then
		echo "+ rustc installed already"
		return 0
	fi

	rustup::install_toolchain

	source "$HOME/.cargo/env"

	if which rustc 2>/dev/null ; then
		echo "+ rustc installed"
	else
		echo "- rustc not installed"
	fi

	if which rustup 2>/dev/null ; then
		mkdir -p ~/.local/share/bash-completion/completions

		rustup completions bash > ~/.local/share/bash-completion/completions/rustup
		echo "+ rustup bash completions installed"

		rustup completions bash cargo > ~/.local/share/bash-completion/completions/cargo
		echo "+ cargo bash completions installed"
	fi
}
