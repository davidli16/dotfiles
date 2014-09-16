" === Enable features ===
filetype off
filetype plugin indent on

" === Basic Commands ===
set autoindent
set autoread
set guioptions-=T
set nobackup
set nocompatible
set noswapfile
set nowb
set nu
set ruler
set smartindent
set ttyfast
set pastetoggle=<f8>

" === VIM User Interface ===
" set mouse=a
set backspace=indent,eol,start
set colorcolumn=81
set completeopt=longest,menuone
set cursorline
set laststatus=2
set list
set listchars=tab:·-,trail:-
set matchtime=5
set nostartofline
set number
set relativenumber
set scrolloff=5
set showcmd
set sidescrolloff=5
set splitbelow
set splitright
set wildmenu

syntax on

" === Folding ===
" set foldmethod=indent
" set nofoldenable

" === Searching ===
set gdefault
set hlsearch
set ignorecase
set incsearch
set showmatch
set smartcase

" === History ===
set undodir=/tmp
set undofile
" set undolevels=1000
" set undoreload=1000

" === Text Formatting and Layout ===
set expandtab
set nowrap
set shiftwidth=2
set softtabstop=2
set tabstop=2
set encoding=utf-8

" === Key Bindings ===
let mapleader = ","

nmap ; :
imap jj <esc>
nnoremap [ <c-w>h
nnoremap ] <c-w>l
nnoremap { <c-w>j
nnoremap } <c-w>k
nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>
" Hides search highlights
nnoremap <leader><space> :noh<cr>
" Sorts the lines
nnoremap <leader>s :sort<cr>
" Disable arrow nav outside of insert mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <space> <leader>zA

" === Styles ===
hi ColorColumn ctermbg=234 guibg=234
hi OverLength ctermbg=red ctermfg=white guibg=#592929
hi VertSplit ctermbg=237 guibg=237
match OverLength /\%101v.\+/
set fillchars+=vert:\ 

" === Plugins ===
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

Plugin 'sjl/gundo.vim'
nnoremap <leader>u :GundoToggle<cr>

Plugin 'mileszs/ack.vim'
nmap <leader>a :Ack 

call vundle#end()
