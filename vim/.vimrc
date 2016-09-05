" TABLE OF CONTENTS:
" 1. Generic settings
" 2. Vim-Plug plugins
" 3. File settings
" 4. Specific filetype settings
" 5. Colors and UI
" 6. Maps and functions

" ===================
" 1. GENERIC SETTINGS
" ===================
set nocompatible " disable vi compatibility mode
set history=1000 " increase history size

" =================
" 2. VIM-PLUG PLUGINS
" =================
" Init vim-plug
if has("win32") || has("win64")
    call plug#begin('$USERPROFILE/vimfiles/plugged/')
else
    call plug#begin('~/.vim/plugged/')
end


" Plug-ins
Plug 'scrooloose/nerdtree'
"NERD Tree es un plugin que te permite explorar tu sistema de archivos desde
"Vim con una estructura de árbol. Puedes abrir archivos y directorios o
"realizar operaciones simples sobre los archivos usando el teclado. Además
"tiene un conveniente resaltado para diferentes tipos de archivos como enlaces
"simbólicos, ejecutables o de sólo lectura.
Plug 'ctrlpvim/ctrlp.vim'
"With ctrlp opening files has never been easier. It fuzzy matches your input
"string to files in your project, most-recently-used (mru) list, and more.
"Pressing ctrl + p opens up an intuitive interface that lists matching files
"as you type
Plug 'Valloric/YouCompleteMe' 
"A feature found in large IDE's that many beginners miss when transitioning to
"vim is autocomplete. YouCompleteMe provides that feature, with support for
"many languages.
Plug 'scrooloose/syntastic' 
"Static code analysis helps identify bugs early in the development process. 
"Syntastic provides syntax checking for a wide array of languages by running
"the source code through external syntax checkers.
Plug 'scrooloose/nerdcommenter'
"To put it simply, nerdcommenter makes it really easy to comment out and 
"uncomment blocks of code.
Plug 'vim-airline/vim-airline'
"Vim-airline makes the status bar beautiful, adorning it with useful 
"information such as the current git branch.
Plug 'easymotion/vim-easymotion'
"EasyMotion provides a much simpler way to use some motions in vim. It takes
"the <number> out of <number>w or <number>f{char} by highlighting all possible
"choices and allowing you to press one key to jump directly to the target.
Plug 'airblade/vim-gitgutter'
"Vim Git Gutter is a Vim plugin which shows a git diff in the 'gutter' (sign 
"column). It shows whether each line has been added, modified, and where lines 
"have been removed.

"Plug 'ap/vim-buftabline'
"Buftabline takes over the tabline and renders the buffer list in it instead of 
"a tab list. It is designed with the ideal that it should Just Work: drop it
"into your setup and you're done. There is only minimal configurable behavior.
"This functionality is included in Vim-airline



" Language support
"Plug 'wlangstroth/vim-racket'
"Plug 'tfnico/vim-gradle'
"Plug 'tpope/vim-rails'
"Plug 'tpope/vim-endwise'
"Plug 'alvan/vim-closetag'
"Plug 'rust-lang/rust.vim'
"Plug 'racer-rust/vim-racer'

" Colorschemes
Plug 'cschlueter/vim-wombat'

"Vim Plug End
call plug#end()


" ================
" 3. FILE SETTINGS
" ================

" 70s are over and swap files are part of the past.
" If you need to backup something, use Git, for God's sake.
"set noswapfile
"set nobackup

" Modify indenting settings
set autoindent              " autoindent always ON.
set expandtab               " expand tabs
set shiftwidth=4            " spaces for autoindenting
set softtabstop=4           " remove a full pseudo-TAB when i press <BS>

" Modify some other settings about files
set encoding=utf-8          " always use unicode (god damnit, windows)
set backspace=indent,eol,start " backspace always works on insert mode
set hidden

" =============================
" 4. SPECIFIC FILETYPE SETTINGS
" =============================

" Some programming languages work better when only 2 spaces padding is used.
autocmd FileType html,css,sass,scss,javascript setlocal sw=2 sts=2
autocmd FileType json setlocal sw=2 sts=2
autocmd FileType ruby,eruby setlocal sw=2 sts=2
autocmd FileType yaml setlocal sw=2 sts=2

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.html.erb,*.xml.erb,*.xml"

"let g:racer_cmd="/Users/danirod/.cargo/bin/racer"
"let $RUST_SRC_PATH="/usr/local/src/rustc/src"


" ================
" 5. COLORS AND UI
" ================
" Are we supporting colors?
if &t_Co > 2 || has("gui_running")
   syntax on
   set colorcolumn=80
   silent! color wombat
endif

" Extra fancyness if full pallete is supported.
if &t_Co >= 256 || has("gui_running")
    set cursorline
    set cursorcolumn
    silent! color wombat256
endif

" Trailing spaces
if &t_Co > 2 || has("gui_running")
    " Because we have color, colourize them
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
else
    " Fallback
    set listchars=trail:~
    set list
endif

set fillchars+=vert:\   " Remove unpleasant pipes from vertical splits
                        " Sauce on this: http://stackoverflow.com/a/9001540

set showmode            " always show which more are we in
set laststatus=2        " always show statusbar
set wildmenu            " enable visual wildmenu

set nowrap              " don't wrap long lines
set number              " show line numbers
set relativenumber      " show numbers as relative by default
set showmatch           " higlight matching parentheses and brackets

if &t_Co >= 256 || has("gui_running")
    set cursorcolumn    " cursor column is fine but only with enough colors
endif

" =====================
" 6. MAPS AND FUNCTIONS
" =====================
let mapleader=","

" Make window navigation less painful.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Move CtrlP to CtrlT (CtrlP is for buffers)
let g:ctrlp_map = '<C-t>'

" Working with buffers is cool.
set hidden
map <C-N>  :bnext<CR>
map <C-P>  :bprev<CR>
imap <C-N> <Esc>:bnext<CR>a
imap <C-P> <Esc>:bprev<CR>a

" NERDTree: map ,nt for toggling NERDTree. Faster than the old :NT command
" since I don't have to hold Shift whenever I want to display NERDTree.
nmap <Leader>nt :NERDTreeToggle<cr>
:let g:NERDTreeWinSize=20

" Relative numbering is pretty useful for motions (3g, 5k...). However I'd
" prefer to have a way for switching relative numbers with a single map.
nmap <F5> :set invrelativenumber<CR>
imap <F5> <ESC>:set invrelativenumber<CR>a



