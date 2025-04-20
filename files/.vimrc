set nocompatible              " be iMproved, required
filetype off                  " required

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'git://git.wincent.com/command-t.git'
Plug 'martinda/Jenkinsfile-vim-syntax'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'ghewgill/vim-scmdiff'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tomasr/molokai'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'chriskempson/base16-vim'
"Plugin 'dsolstad/vim-wombat256i'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
set rtp+=~/.fzf

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" INDENT STUFF
set autoindent
set smartindent

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" jumping between brackets and stuff
set showmatch

" highly obnoxius visual bell
set vb

" SEARCHES
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
set gdefault " lazyness to type the g in s/foo/bar/g
set laststatus=2
"done with highligh, move on"
nnoremap <leader><space> :noh<cr>

" Scroll ahead
set scrolloff=4
set sidescrolloff=5
set sidescroll=1

"too long line
set wrap
set textwidth=79
set formatoptions=qrn1
"if exists('+colorcolumn')
    "set colorcolumn=80
"endif

" EXTRA COOL STUFF
set showtabline=2 " always show tab bar
set cul "hightlight current line"
set wildmenu  "autocomplete menu"
set wildmode=longest:full,full "autocomplete text"
set title " show document title on window
set ruler " show line and char pos
set showmode "show current mode"
set showcmd "show commands inserted"


set clipboard=unnamed
set mouse=a

" toggle numbers to absolute on insert mode"
set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

set autochdir "change to current directory"

" show invisible chars? show invisible chars
"set list
"set listchars=tab:▸\ ,eol:¬

" I WANT TO USE ARROWS, problem?
nnoremap <up> gk
nnoremap <down> gj

" nice moving around
nnoremap j gj
nnoremap k gk

" not my style, but have no use for F1 anyway
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" COLOR SECTION "
" no color, no joy
syntax on
" default color
set background=dark
colorscheme molokai

" delimate
let delimitMate_jump_expansion = 0
let delimitMate_expand_cr = 0

" theme
let g:molokai_original = 1
let g:rehash256 = 1

" Vim-airline
let g:airline_theme = "powerlineish"
let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
     \ 'n'  : 'NORMAL',
     \ 'i'  : 'INSERT',
     \ 'R'  : 'REPLCE',
     \ 'v'  : 'VISUAL',
     \ 'V'  : 'V LINE',
     \ }

let g:go_fmt_command = "goimports"

let @-='i-SNAPSHOT'

" UNDO FILE "
"set undofile
"set directory^=$HOME/.vim/tmp/
"set undodir=$HOME.vim/tmp/
"antecipate scroll


" now set it up to change the status line based on mode
"if version >= 700
"    au InsertEnter * hi StatusLine ctermbg=black ctermfg=green
"    au InsertLeave * hi StatusLine ctermbg=white ctermfg=black
"endif

"highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

"highlight OnLength ctermbg=yellow ctermfg=black
"match OnLength /\%80v./

"au BufWritePost *.tex !pdflatex <afile>
