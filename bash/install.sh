#!/bin/bash

if [ ! -d "$HOME/.extra_aliases" ]; then
	/bin/touch "$HOME/.extra_aliases"
fi

if [ -f "$HOME/.aliases" ]; then
	/bin/rm "$HOME/.aliases"
fi

if [ -f "$HOME/.bash_prompt" ]; then
	/bin/rm "$HOME/.bash_prompt"
fi

if [ -f "$HOME/.bashrc" ]; then
	/bin/rm "$HOME/.bashrc"
fi

if [ -f "$HOME/.env_vars" ]; then
	/bin/rm "$HOME/.env_vars"
fi

/bin/ln .bash_prompt $HOME/.bash_prompt
/bin/ln .bashrc $HOME/.bashrc
/bin/ln .aliases $HOME/.aliases
/bin/ln .env_vars $HOME/.env_vars
