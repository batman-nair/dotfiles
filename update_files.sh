cp ~/.Xresources .
cp ~/.zshrc .
cp ~/.xinitrc .
cp ~/.xprofile .
cp ~/.vimrc .
cp ~/.bashrc .

# Script files
cp -rf ~/.scripts ./

# Config files
cp ~/.config/compton.conf ./config/compton.conf
cp -rf ~/.config/rofi ./config/
cp -rf ~/.config/termite ./config/
cp -rf ~/.config/polybar ./config/
cp -rf ~/.config/i3 ./config/
cp -rf ~/.config/dunst ./config/
cp -rf ~/.config/ranger ./config/

# Other config
cp /etc/mpd.conf .
