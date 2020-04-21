cp ~/.zshrc .
cp ~/.vimrc .
cp ~/.bashrc .
cp ~/.emacs .

# Script files
cp -R ~/.scripts/. ./scripts

# Config files
cp ~/.config/compton.conf ./config/compton.conf
cp -rf ~/.config/rofi ./config/
cp -rf ~/.config/termite ./config/
cp -rf ~/.config/polybar ./config/
cp -rf ~/.config/i3 ./config/
cp -rf ~/.config/dunst ./config/
cp -rf ~/.config/neofetch/config.conf ./config/neofetch.conf

# Ranger files
cp -rf ~/.config/ranger/rc.conf ./config/ranger/
cp -rf ~/.config/ranger/shortcuts.conf ./config/

# Other config
cp /etc/mpd.conf .
