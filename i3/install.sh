/bin/rm $HOME/.i3/config
/bin/ln config $HOME/.i3/config

/bin/rm $HOME/.Xresources
/bin/ln .Xresources $HOME/.Xresources
xrdb $HOME/.Xresources

sudo /bin/rm /etc/lightdm/slick-greeter.conf
sudo /bin/mv slick-greeter.conf /etc/lightdm/slick-greeter.conf

/bin/rm $HOME/.config/autostart/display-setup.sh
/bin/ln display-setup.sh $HOME/.config/autostart/display-setup.sh

# Background
sudo /bin/mv backgrounds/bg.jpg /usr/share/backgrounds/bg.jpg
sudo /bin/mv backgrounds/bg2.jpg /usr/share/backgrounds/bg2.jpg
nitrogen

# Theme
git clone https://github.com/stronk-dev/Tokyo-Night-Linux
sudo /bin/mv Tokyo-Night-Linux/usr/share/themes/TokyoNight /usr/share/themes/TokyoNight
/bin/rm -rf Tokyo-Night-Linux

yay -S numix-icon-theme-git
sudo pacman -S noto-fonts-emoji

lxappearance
i3-msg restart



