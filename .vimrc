set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'martinda/Jenkinsfile-vim-syntax'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ghewgill/vim-scmdiff'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tomasr/molokai'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'chriskempson/base16-vim'
"Plugin 'dsolstad/vim-wombat256i'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
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

" Show me the line numbers relative to actual
if exists('+relativenumber')
    set relativenumber
    au FocusLost * :set number
    au FocusGained * :set relativenumber
endif

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
let g:airline_powerline_fonts = 0
let g:airline_mode_map = {
     \ 'n'  : 'NORMAL',
     \ 'i'  : 'INSERT',
     \ 'R'  : 'REPLCE',
     \ 'v'  : 'VISUAL',
     \ 'V'  : 'V LINE',
     \ }

let g:go_fmt_command = "goimports"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['java','c'],'passive_filetypes': [] }


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
" some auto expand text
ab imavc int main(int argc, char**argv) {<CR><CR>return 0;<CR>}<UP><TAB>
ab psvm public static void main(String[] args) {<CR><CR>}<UP><TAB>
ab javanewf /**<CR> *<CR>*/<CR><BACKSPACE>{<CR><CR>}<UP><UP><UP><UP><RIGHT>
