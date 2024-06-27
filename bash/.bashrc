#! /bin/zsh -
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


export PATH=$PATH:/usr/local/go/bin
export GPG_TTY=$(tty)
export PATH="~/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

cdnvm() {
    command cd "$@" || return $?
    nvm_path="$(nvm_find_up .nvmrc | command tr -d '\n')"

    # If there are no .nvmrc file, use the default nvm version
    if [[ ! $nvm_path = *[^[:space:]]* ]]; then

        declare default_version
        default_version="$(nvm version default)"

        # If there is no default version, set it to `node`
        # This will use the latest version on your machine
        if [ $default_version = 'N/A' ]; then
            nvm alias default node
            default_version=$(nvm version default)
        fi

        # If the current version is not the default version, set it to use the default version
        if [ "$(nvm current)" != "${default_version}" ]; then
            nvm use default
        fi
    elif [[ -s "${nvm_path}/.nvmrc" && -r "${nvm_path}/.nvmrc" ]]; then
        declare nvm_version
        nvm_version=$(<"${nvm_path}"/.nvmrc)

        declare locally_resolved_nvm_version
        # `nvm ls` will check all locally-available versions
        # If there are multiple matching versions, take the latest one
        # Remove the `->` and `*` characters and spaces
        # `locally_resolved_nvm_version` will be `N/A` if no local versions are found
        locally_resolved_nvm_version=$(nvm ls --no-colors "${nvm_version}" | command tail -1 | command tr -d '\->*' | command tr -d '[:space:]')

        # If it is not already installed, install it
        # `nvm install` will implicitly use the newly-installed version
        if [ "${locally_resolved_nvm_version}" = 'N/A' ]; then
            nvm install "${nvm_version}";
        elif [ "$(nvm current)" != "${locally_resolved_nvm_version}" ]; then
            nvm use "${nvm_version}";
        fi
    fi
}

alias cd='cdnvm'
cdnvm "$PWD" || exit

fontSize=10
fontName="Mononoki Nerd Font Mono"
# Adjust Base fontSize and Font Name accordingly
zoomCommandPrefix='printf "\33]50;%s\007" "xft:$fontName-'
# https://bbs.archlinux.org/viewtopic.php?pid=1584742#p1584742
# You can also opt to change .Xresources for fonts, more complications though

function checkReadability() {
	local suggestedFont=$1
	if [ $suggestedFont -ge 6 ] && [ $suggestedFont -le 50 ]
	# pragmatic bounds for legibility. change for your monitor and vision skills
	then
		fontSize=$(($suggestedFont))
		return
	else
		notify-send "Illegible Shit"
		# https://aur.archlinux.org/packages/notify-send.sh/ not vital though
	fi
}

function zoomInTerm() {
	local suggestedFont=$(( $fontSize + 1 ))
	checkReadability $suggestedFont
	# echo "Zoomed In"
	zoomIn="$zoomCommandPrefix$fontSize\""
	eval $zoomIn
}

function zoomOutTerm() {
	local suggestedFont=$(( $fontSize - 1 ))
	checkReadability $suggestedFont
	# echo "Zoomed Out"
	zoomOut="$zoomCommandPrefix$fontSize\""
	eval $zoomOut
}

alias zi=zoomInTerm
alias zo=zoomOutTerm

bind "'[A': zoomInTerm" # Ctrl + Up
bind "'[B': zoomOutTerm" # Ctrl + Down

baseFontZoom="$zoomCommandPrefix$fontSize\""
eval $baseFontZoom
# sets up the base Zoom and Font for Terminal
