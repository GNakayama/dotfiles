#!/bin/bash

if [ ! -d "$HOME/.extra_aliases" ]; then
	/bin/touch "$HOME/.extra_aliases"
fi

/bin/ln .bash_prompt $HOME/.bash_prompt
/bin/ln .bashrc $HOME/.bashrc
/bin/ln .aliases $HOME/.aliases
/bin/ln .env_vars $HOME/.env_vars
