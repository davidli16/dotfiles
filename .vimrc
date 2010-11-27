" Basic Commands
set nocompatible
set autoindent
set smartindent
set showmatch
set guioptions-=T
set ruler
set hls
set nu
set incsearch
set mouse=a

" VIM User Interface
set backspace=indent,eol,start
set laststatus=2
set matchtime=5
set list
set nostartofline
set number
set showmatch
set listchars=tab:·-,trail:-
set mouse=a
set relativenumber
set completeopt=longest,menuone

syntax on

" Text Formatting and Layout
set nowrap
set tabstop=2
set shiftwidth=2

" Key Bindings
let mapleader = ","

nmap [ <C-w>h
nmap ] <C-w>l
nmap { <C-w>k
nmap } <C-w>j
nmap ; :
nmap \ :FufCoverageFile<CR>
nmap <Leader>f :FufMruFile<CR>
nmap <Leader>t :NERDTree<CR>

" Enable features
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
let g:fuf_modesDisable = ['mrucmd']
filetype plugin on

color jellybeans
