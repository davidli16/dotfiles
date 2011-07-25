" Basic Commands
set autoread
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
set noswapfile
set nowb
set nobackup

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
set cursorline

syntax on

" History
set undodir=/tmp
set undofile
set undolevels=1000
set undoreload=10000

" Text Formatting and Layout
set nowrap
set tabstop=2
set shiftwidth=2

" Key Bindings
let mapleader = ","

nmap ; :
imap ;; <Esc>
nmap \ :FufCoverageFile<CR>
nmap <Leader>f :FufMruFile<CR>
nmap <Leader>d :FufDir<CR>
nmap <Leader>t :NERDTree<CR>
nnoremap <Leader>u :GundoToggle<CR>

" Enable features
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
let g:fuf_modesDisable = ['mrucmd']
filetype plugin on

color jellybeans
