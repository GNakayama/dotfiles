#!/bin/bash

if [ -f "$HOME/.gitconfig" ]; then
	/bin/rm "$HOME/.gitconfig"
fi

/bin/ln .gitconfig $HOME/.gitconfig
