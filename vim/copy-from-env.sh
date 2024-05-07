#!/bin/bash

/bin/cp $HOME/.vimrc ./.vimrc

if [ -f "$HOME/.vimrc" ]; then
	/bin/rm "$HOME/.vimrc"
fi

/bin/ln .vimrc $HOME/.vimrc
