#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# setup prompt
if [ -f "$HOME/.bash_prompt" ]; then
	. ~/.bash_prompt
fi

# setup aliases
if [ -f "$HOME/.aliases" ]; then
	. ~/.aliases
fi

# export vars
if [ -f "$HOME/.env_vars" ]; then
	. ~/.env_vars
fi

# Run ssh-agent if it is not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

# Completion
git_completion_file="/usr/share/git/completion/git-completion.bash"
if [ -f $git_completion_file ]; then
	. $git_completion_file
fi

# Allows ctr+s in terminal
stty -ixon
source /usr/share/nvm/init-nvm.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GPG_TTY=$(tty)
export PATH="~/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
