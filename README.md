# Dotfiles
The behind the scenes config files of what runs on my Linux system.

Manjaro linux. Long time i3 user but now use KDE as it suits my workflow much more nicely.

## i3-gaps
![i3_gaps_clean](screenshots/i3_gaps_clean.png)
10 Workspaces:
 1. Shell
 2. Coding,
 3. Browsers,
 4. File manager,
 5. Documents,
 6. Games,
 7. Media,
 8. IRC chat,
 9. Extra bin,
 10. Music

Windows go to their workspaces automatically so it's easy to find any window in an instant.
Wallpaper and overall colorscheme controlled using [pywal](https://github.com/dylanaraps/pywal).

 - Bottom bar - [Polybar](https://github.com/polybar/polybar)
 - Application launcher - [rofi](https://github.com/davatorium/rofi)
 - Terminal - termite
 - Browser - [qutebrowser](https://github.com/qutebrowser/qutebrowser) - keyboard based, vim-like browser
 - File manager - [ranger](https://github.com/ranger/ranger) - vim inspired file manager for console
 - Document viewer - [zathura](https://wiki.archlinux.org/index.php/Zathura) - minimal pdf viewer with vi styled keybindings
 - Games - Steam
 - Media player - mpv/vlc
 - IRC client - HexChat
 - Music player - mpd + [ncmpcpp](https://wiki.archlinux.org/index.php/Ncmpcpp) - console based music player (not used now)
 - Lockscreen - [betterlockscreen](https://github.com/pavanjadhaw/betterlockscreen)

Special modes in i3:
 - Game Mode - disable all key binding for no interference,
 - Music mode - for quick music controls using keyboard only from anywhere.

There are more special stuff, if interested you can go through [i3 config](config/i3/config). It's pretty well documented.

## Shell
![shell](screenshots/shell.png)
I use zsh with oh-my-zsh. Default robbyrussell theme looks good and minimal for my liking. Nothing special here.

## Scripts
The folder was inspired and started from Luke Smith's dotfiles.

 - btmenu - Connect with bluetooth devices using rofi as interface.
 - compiler - Compile any file based on the type of the file.
 - dmenumount - dmenu interface for mounting disks.
 - dpass - dmenu interface to type password.
 - opout - Run any file based on type of the file.
 - shortcuts.sh - Add the configs and folders shortcuts to shell and ranger
 - utility - Master interface for bluetooth and wifi menu using rofi.

## Ranger
![ranger](screenshots/ranger1.png)
A console file manager with vim key bindings. I have additional shortcuts for quick access to my main folders. The shortcuts script helps create this automatically.

Example, to **g**o to my **w**orks folder just press **gw** and similar.

## Polybar
![polybar](screenshots/polybar.png)

## Rofi
![rofi](screenshots/rofi.png)
Application launcher for i3. My own theme :D

## Vim
Vim Plug for plugins

| Package        | Description                                             |
| --             | --                                                      |
| [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)  | Pretty cool autocomplete                                |
| [emmet-vim](https://github.com/mattn/emmet-vim)      | Emmet snippets for web                                  |
| [goyo.vim](https://github.com/junegunn/goyo.vim)       | Beautiful distraction less mode for writing             |
| [syntastic](https://github.com/vim-syntastic/syntastic)      | Syntax and code checker                                 |
| [tcomment_vim](https://github.com/tomtom/tcomment_vim)   | File type based auto comment                            |
| [wal.vim](https://github.com/dylanaraps/wal.vim)        | Wal colorscheme according to wallpaper                  |
| [vim-airline](https://github.com/vim-airline/vim-airline)    | For cooler status bar                                   |
| [vim-easyescape](https://github.com/zhou13/vim-easyescape) | Press jk or kj to quick escape                          |
| [vim-easymotion](https://github.com/easymotion/vim-easymotion) | Quick move to anywhere on screen                        |
| [vim-gitgutter](https://github.com/airblade/vim-gitgutter)  | git integration for showing changed lines               |
| [vim-repeat](https://github.com/tpope/vim-repeat)     | For supporting surround repeats                         |
| [vim-surround](https://github.com/tpope/vim-surround)   | Easier surrounding brackets or quotes and stuff editing |

Some other custom stuff:
 - opout and compiler script shortcuts for easy compile and running files from vim itself.
 - Guide marker(`<++>`) for easy and quick navigation
 - Lots of custom snippets using the markers for easy code.

## Emacs
I use default emacs with evil keybindings. Plugins used:

| Package         | Description                                               |
| --              | --                                                        |
| [ace-jump-mode](https://github.com/winterTTr/ace-jump-mode)   | Quickly move anywhere in screen in couple of key presses  |
| [cmake-ide](https://github.com/atilaneves/cmake-ide)       | Sets up stuff nicely with cmake                           |
| [company](https://github.com/company-mode/company-mode)         | Nice autocomplete                                         |
| [evil](https://github.com/emacs-evil/evil)            | Vim on emacs                                              |
| [evil-goggles](https://github.com/edkolev/evil-goggles)    | A visual cue on area affected by area command. Aesthetics |
| [evil-surround](https://github.com/emacs-evil/evil-surround)   | Similar to vim-surround in emacs evil                     |
| [evil-visualstar](https://github.com/bling/evil-visualstar) | Pressing * or # searches visual selection                 |
| [flycheck](https://github.com/flycheck/flycheck)        | Syntax checker                                            |
| [grip-mode](https://github.com/seagle0128/grip-mode)       | Github flavour markdown preview                           |
| [magit](https://github.com/magit/magit)           | Super powerful git in emacs                               |
| [markdown-mode](https://github.com/jrblevin/markdown-mode)   | Markdown support for emacs                                |
| [telephone-line](https://github.com/dbordak/telephone-line)  | Powerline for emacs                                       |
| [undo-tree](https://www.emacswiki.org/emacs/UndoTree)       | Much easier undo implementation                           |
| [whiteroom-mode](https://github.com/joostkremers/writeroom-mode)  | Similar to Goyo for Vim, beauty writing mode              |

There are a lot of custom changes, here are a few:
 - Windmove for quick movement between windows
 - Keymappings for hybrid evil mode working.(Default emacs keybindings work when in insert mode)
 - winner-mode for saved window configs
 - org-mode for tasks(don't use them now though)


## KDE
![kde](screenshots/kde.png)
I currently use KDE as it suits my workflow much better and easier to use.

I emulate the workspaces concept from i3 using activities in KDE. The main/default activity has the browser or other supporting application. Second activity will have emacs. Third will have music/media if any. I use Win + number key to quickly switch between activities. That's about it for workflow. Terminal and code editing is all within emacs itself.



## More Screenshots

![i3_gaps_dirty](screenshots/i3_gaps_dirty.png)

![i3_gaps_aesthetics](screenshots/i3_gaps_aesthetics.png)

![ranger1](screenshots/ranger1.png)
