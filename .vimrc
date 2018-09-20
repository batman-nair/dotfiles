
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

let mapleader =" "

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'zhou13/vim-easyescape'

Plug 'dylanaraps/wal.vim'

Plug 'junegunn/goyo.vim'

Plug 'junegunn/seoul256.vim'

Plug 'klen/python-mode'

Plug 'airblade/vim-gitgutter'

Plug 'easymotion/vim-easymotion'
Plug 'vim-syntastic/syntastic'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Initialize plugin system
call plug#end()

" Python Mode making default python3
let g:pymode_python = 'python3'
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0

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

" Awesome quick word motion with easymotion
nmap gw <Plug>(easymotion-bd-w)

" enable/disable syntastic integration
let g:airline#extensions#syntastic#enabled = 1

" syntastic error_symbol
let airline#extensions#syntastic#error_symbol = 'E:'

" syntastic statusline error format (see |syntastic_stl_format|)
let airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'

" syntastic warning
let airline#extensions#syntastic#warning_symbol = 'W:'

" syntastic statusline warning format (see |syntastic_stl_format|)
let airline#extensions#syntastic#stl_format_err = '%W{[%w(#%fw)]}'

" Commenting stuff
let b:commentChar='#'
autocmd BufNewFile,BufReadPost *.[ch]    let b:commentChar='//'
autocmd BufNewFile,BufReadPost *.cpp    let b:commentChar='//'
autocmd BufNewFile,BufReadPost *.py    let b:commentChar='#'
autocmd BufNewFile,BufReadPost *.*sh    let b:commentChar='#'
function! Docomment ()
  "make comments on all the lines we've grabbed
  execute '''<,''>s/^\s*/&'.escape(b:commentChar, '\/').' /e'
endfunction
function! Uncomment ()
  "uncomment on all our lines
  execute '''<,''>s/\v(^\s*)'.escape(b:commentChar, '\/').'\v\s*/\1/e'
endfunction
function! Comment ()
  "does the first line begin with a comment?
  let l:line=getpos("'<")[1]
  "if there's a match
  if match(getline(l:line), '^\s*'.b:commentChar)>-1
    call Uncomment()
  else
    call Docomment()
  endif
endfunction
" For some reason in normal mode <C-/> becomes <C-_>
nnoremap <silent> <C-_> V:<C-u>call Comment()<cr><cr>
vnoremap <silent> <C-/> :<C-u>call Comment()<cr><cr>

" base16 colorscheme fix
" set termguicolors

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 233
"colo seoul256

" Live latex settings
let g:livepreview_previewer = 'zathura'

" Remove trailing whitespaces when saving
autocmd BufWritePre * %s/\s\+$//e

colorscheme wal

set backupdir=~/.vim/tmp//,.
set directory=~/.vim/tmp//,.
set undodir=~/.vim/tmp//,.

set tabstop=4
set softtabstop=4 expandtab smarttab
set shiftwidth=4

set number
set relativenumber

set splitbelow
set splitright

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" MAPPINGS

"" Change to solid colorscheme
    map <F2> :set termguicolors!<CR>:colo base16-monokai<CR>

"" NERDTree shortcut
    map <C-n> :NERDTreeToggle<CR>

"" Move through wrapped line with fix for numbered line jumps
    nnoremap <expr> j v:count ? 'j' : 'gj'
    nnoremap <expr> k v:count ? 'k' : 'gk'

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

"" Run compiled output of current file
	map <leader>o :!opout <c-r>%<CR>

"" Compile document
	map <leader>c :!compiler <c-r>%<CR>

"" Open ranger
    map <leader>t :!termite -e "zsh -ic ranger" &<CR>

" Press Space to turn off highlighting and clear any message already displayed.
    nnoremap <silent><leader><Space> :set hlsearch! hlsearch?<CR>

"" Spell-check with F6
    map <F6> :setlocal spell! spelllang=en_us<CR>

"" Goyo
    map <F10> :Goyo<CR>
    inoremap <F10> <Esc>:Goyo<CR>a

"" Copy with Ctrl C
    map <C-c> "+y
    map <C-p> "+P

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost ~/.scripts/folders,~/.scripts/configs !bash ~/.scripts/shortcuts.sh

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" C-T for new tab
	nnoremap <C-t> :tabnew<cr>

"" Navigating with guides
    inoremap ;im <++>
	inoremap ;<Tab> <Esc>/<++><Enter>"_c4l
	vnoremap ;<Tab> <Esc>/<++><Enter>"_c4l
	map ;<Tab> <Esc>/<++><Enter>"_c4l
	nnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l

 "____        _                  _
"/ ___| _ __ (_)_ __  _ __   ___| |_ ___
"\___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
 "___) | | | | | |_) | |_) |  __/ |_\__ \
"|____/|_| |_|_| .__/| .__/ \___|\__|___/
              "|_|   |_|

"" C++
	autocmd Filetype cpp,c inoremap ;in <Esc>I#include<Space><><Enter><++><Esc>=kf>i
	autocmd Filetype cpp,c inoremap ;in <++><Esc>O#include<Space><><Esc>i
	autocmd Filetype cpp,c inoremap ;wh <Esc>Iwhile()<Space>{<Enter><++><Enter>}<Enter><Esc>3=kf)i
	autocmd Filetype cpp,c inoremap ;fo <Esc>Ifor(;<Space><++>;<Space><++>)<Space>{<Enter><++><Enter>}<Enter><Esc>3=kf;i
	autocmd Filetype cpp inoremap ;fv <Esc>Ifor(:<Space><++>)<Space>{<Enter><++><Enter>}<Enter><Esc>3=kf:i
	autocmd Filetype cpp,c inoremap ;if <Esc>Iif()<Space>{<Enter><++><Enter>}<Enter><Esc>3=kf)i
	autocmd Filetype cpp inoremap ;ve <Esc>Ivector<><Space><++>;<Enter><++><Esc>=kf>i
	autocmd Filetype cpp inoremap ;se <Esc>Iset<><Space><++>;<Enter><++><Esc>=kf>i
    autocmd Filetype cpp,c inoremap ;def <Esc>I#define<Space><Enter><++><Esc>kA
    autocmd Filetype cpp inoremap ;be .begin(),<Space><++>.end()<Esc>Fbhi
    autocmd Filetype cpp,c inoremap ;co <Esc>Icout<<""<<endl;<Enter><++><Esc>=kf"li
    autocmd Filetype cpp,c nnoremap ;co Icout<<""<<endl;<Enter><++><Esc>=kf"li
    autocmd Filetype cpp,c inoremap ;cd <Esc>Ocout<<"Debug:"<<endl;<Esc><F"i
    autocmd Filetype cpp,c nnoremap ;cd Ocout<<"Debug:"<<endl;<Esc><F"i

    " Namespace
    autocmd Filetype cpp,c inoremap ;s: std::

    " Templates
    autocmd Filetype cpp inoremap ;main <Esc>:read ~/code/cpp_templates/default.cpp<Enter>

"" HTML
    autocmd FileType html inoremap ;d <div><++></div><Space><++><Esc>0f>i
    autocmd FileType html inoremap ;s <span></span><Space><++><Esc>FsT>i
    autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
    autocmd FileType html inoremap ;c class=""<Esc>i
    autocmd FileType html inoremap ;e <em></em><Space><++><Esc>FeT>i
    autocmd FileType html inoremap ;1 <h1></h1><Space><++><Esc>FhT>i
    autocmd FileType html inoremap ;2 <h2></h2><Space><++><Esc>FhT>i
    autocmd FileType html inoremap ;3 <h3></h3><Space><++><Esc>FhT>i
    autocmd FileType html inoremap ;4 <h4></h4><Space><++><Esc>FhT>i
    autocmd FileType html inoremap ;p <p></p><Space><++><Esc>FpT>i
    autocmd FileType html inoremap ;a <a<Space>href=""></a><Space><++><Esc>FaT>i
    autocmd FileType html inoremap ;i <img src="" alt="<++>"><++><esc>Fcf"a

"" MARKDOWN
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,4 ####<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>

"" Javascript
	autocmd Filetype javascript inoremap ;if <Esc>Iif()<Space>{<Enter><++><Enter>}<Enter><Esc>3=kf)i
	autocmd Filetype javascript inoremap ;fo <Esc>Ifor(;<Space><++>;<Space><++>)<Space>{<Enter><++><Enter>}<Enter><Esc>3=kf;i
    autocmd Filetype javascript inoremap ;fu function()<Space>{<Enter><++><Enter>}<++><Esc>2=kf)
