#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"
git pull
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt


if [ ! -d "~/bin/z" ]; then
	# https://github.com/rupa/z
	mkdir -p ~/bin/z
	curl https://raw.github.com/rupa/z/master/z.sh > ~/bin/z/z.sh
	chmod +x ~/bin/z/z.sh
fi

source ~/.bash_profile
