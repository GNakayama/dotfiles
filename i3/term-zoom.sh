#! /bin/zsh -

fontSize=16
fontName="MonoSpace"
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

#zle -N zoomInTerm
#zle -N zoomOutTerm
# for zsh users only, creates zle widgets

bindkey '\e[A' zoomInTerm # Ctrl + Up
bindkey '\e[B' zoomOutTerm # Ctrl + Down

baseFontZoom="$zoomCommandPrefix$fontSize\""
eval $baseFontZoom
# sets up the base Zoom and Font for Terminal
