# Dotfiles
The behind the scenes config files of what runs on my Linux system.

I use Manjaro linux, a variant of Arch linux. I've been a long time i3 user but now I use KDE as it suits my current workflow more. I explain more about my DE choices later.

Most of the applications used are only in i3 only.

## i3-gaps
10 Workspaces:
1 and 2 Shell/Coding,
3 Browsers,
4 File manager,
5 Documents,
6 Games,
7 Media,
8 IRC chat,
9 Extra bin,
10 Music

Windows go to their workspaces automatically and I know where to find any window in an instant.

Wallpaper and overall colorscheme using pywal.

Almost all the applications were vim keybinding compatible.

Bottom bar - Polybar

Application launcher - rofi

Terminal - termite

Browser - qutebrowser

File manager - ranger

Document viewer - zathura

Games - Steam

Media player - mpv/vlc

IRC client - HexChat

Music player - (not used now) cmus + mpd

Lockscreen - betterlockscreen

Special modes in i3:
Game Mode - disable all key binding for no interference,
Music mode - for quick music controls using keyboard only from anywhere.

There are more special stuff, if interested you can go through i3 config. It's pretty well documented.

## Shell
I use zsh with oh-my-zsh. Default robbyrussell theme looks good enough for me. Nothing special here.

## Scripts
The folder was inspired and started from Luke Smith's dotfiles.

btmenu - Connect with bluetooth devices using rofi as interface.
compiler - Compile any file based on the type of the file.
dmenumount - dmenu interface for mounting disks.
dpass - dmenu interface to type password.
opout - Run any file based on type of the file.
shortcuts.sh - Add the configs and folders shortcuts to shell and ranger
utility - Master interface for bluetooth and wifi menu using rofi.

## Ranger
A console file manager with vim key bindings. I have additional shortcuts for quick access to my main folders. The shortcuts script helps create this automatically.

Example, to **g**o to my **w**orks folder just press **gw** and similar.

## Polybar

## Rofi
Application launcher for i3. My own theme :D

## Screenshots

![clean1](screenshots/clean1.png)

![clean2](screenshots/clean2.png)

![clean3](screenshots/clean3.png)

![dirty](screenshots/dirty.png)

![music](screenshots/music.png)
