sudo pacman -S alsa-tools
chmod +x necessary-verbs.sh
sudo mv necessary-verbs.sh /usr/local/sbin/

sudo cp audio-setup-service /etc/systemd/system/audio-setup.service
systemctl enable audio-setup.service
sudo necessary-verbs.sh
