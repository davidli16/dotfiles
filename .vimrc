" Enable features
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
let g:fuf_modesDisable = ['mrucmd']
filetype plugin on

" Basic Commands
set autoread
set nocompatible
set autoindent
set smartindent
set guioptions-=T
set ruler
set nu
set mouse=a
set noswapfile
set nowb
set nobackup
set ttyfast

" VIM User Interface
set backspace=indent,eol,start
set laststatus=2
set matchtime=5
set list
set nostartofline
set number
set listchars=tab:·-,trail:-
set mouse=a
set relativenumber
set completeopt=longest,menuone
set cursorline
set showcmd
set scrolloff=5
set sidescrolloff=5
set wildmenu

syntax on

" Searching
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" History
set undodir=/tmp
set undofile
set undolevels=1000
set undoreload=10000

" Text Formatting and Layout
set nowrap
set tabstop=2
set shiftwidth=2
set encoding=utf-8

" Key Bindings
let mapleader = ","

nmap ; :
imap ;; <esc>
nmap \ :FufCoverageFile<cr>
nmap <leader>f :FufMruFile<cr>
nmap <leader>d :FufDir<cr>
nmap <leader>t :NERDTree<cr>
nmap <leader>a :Ack 
nmap <leader>c <plug>NERDCommenterToggle
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>
nnoremap <leader>u :GundoToggle<cr>
nnoremap [ <c-w>h
nnoremap ] <c-w>l
nnoremap { <c-w>j
nnoremap } <c-w>k
nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %
nnoremap <leader><space> :noh<cr>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

color jellybeans
