
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-sensible'
Plug 'zhou13/vim-easyescape'

Plug 'dylanaraps/wal.vim'

" Start interactive EasyAlign in visual mode (e.g. vipga)

xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

Plug 'junegunn/goyo.vim'

Plug 'junegunn/seoul256.vim'

Plug 'klen/python-mode'

Plug 'airblade/vim-gitgutter'

Plug 'easymotion/vim-easymotion'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'terryma/vim-multiple-cursors'
" Initialize plugin system
call plug#end()

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap gs <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>w <Plug>(easymotion-w)

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 233
"colo seoul256

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

colorscheme wal

set tabstop=4
set softtabstop=4 expandtab smarttab
set shiftwidth=4

set number
set relativenumber

" MAPPINGS

"" Move lines up or down
    nnoremap <C-j> :m .+1<CR>==
    nnoremap <C-k> :m .-2<CR>==
    inoremap <C-j> <Esc>:m .+1<CR>==gi
    inoremap <C-k> <Esc>:m .-2<CR>==gi
    vnoremap <C-j> :m '>+1<CR>gv=gv
    vnoremap <C-k> :m '<-2<CR>gv=gv

"" Better indentation
    vnoremap > >gv
    vnoremap < <gv

"" Press Space to turn off highlighting and clear any message already displayed.
    nnoremap <silent><Space> :set hlsearch! hlsearch?<CR>

"" Spell-check with F6
    map <F6> :setlocal spell! spelllang=en_us<CR>

"" Goyo
    map <F10> :Goyo<CR>
    inoremap <F10> <Esc>:Goyo<CR>a

"" Copy with Ctrl C
    map <C-c> "+y

"" Navigating with guides
	inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	map <Space><Tab> <Esc>/<++><Enter>"_c4l

"" cpp Mappings
	autocmd Filetype cpp inoremap ;in <Esc>I#include<Space><><Enter><++><Esc>=kf>i
	autocmd Filetype cpp inoremap ;fo <Esc>Ifor(;<Space><++>;<Space><++>)<Space>{<Enter><++><Enter>}<Enter><Esc>3=kf;i
	autocmd Filetype cpp inoremap ;if <Esc>Iif()<Space>{<Enter><++><Enter>}<Enter><Esc>3=kf)i
	autocmd Filetype cpp inoremap ;ve <Esc>Ivector<><Space><++>;<Enter><++><Esc>=kf>i
    autocmd Filetype cpp inoremap ;def <Esc>I#define<Space><Enter><++><Esc>kA

    """ Compile and run cpp file
    autocmd Filetype cpp nnoremap <F5> :!g++<Space><C-r>%<Space>-o<Space><C-r>%<BS><BS><BS>o<Space>&&<Space>./<C-r>%<BS><BS><BS>.o<CR>

    """ Templates
    autocmd Filetype cpp inoremap ;main <Esc>:read ~/code/cpp_templates/default.cpp<Enter>
