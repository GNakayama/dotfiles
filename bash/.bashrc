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

# Run ssh-agent if it is not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi
