" Enable features
filetype off
filetype plugin indent on

" Basic Commands
set autoread
set nocompatible
set autoindent
set smartindent
set guioptions-=T
set ruler
set nu
set noswapfile
set nowb
set nobackup
set ttyfast
set pastetoggle=<f8>

" VIM User Interface
set backspace=indent,eol,start
set laststatus=2
set matchtime=5
set list
set nostartofline
set number
set listchars=tab:·-,trail:-
" set mouse=a
set splitright
set splitbelow
set relativenumber
set completeopt=longest,menuone
set cursorline
set showcmd
set scrolloff=5
set sidescrolloff=5
set wildmenu
set colorcolumn=81

syntax on

" Folding
" set foldmethod=indent
" set nofoldenable

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
set undoreload=1000

" Text Formatting and Layout
set nowrap
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set encoding=utf-8

" Key Bindings
let mapleader = ","

nmap ; :
imap jj <esc>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>
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
nnoremap <space> <leader>zA

color jellybeans
hi ColorColumn ctermbg=DarkGray guibg=DarkGray
hi OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'ack.vim'
nmap <leader>a :Ack 

Bundle 'gundo.vim'
nnoremap <leader>u :GundoToggle<cr>

Bundle 'nerdcommenter'
nmap <leader>c <plug>NERDCommenterToggle

Bundle 'nerdtree'
nmap <leader>t :NERDTree<cr>

Bundle 'numbers.vim'
Bundle 'snipmate.vim'
Bundle 'vim-fugitive'

Bundle 'vim-fuzzyfinder'
Bundle 'vim-l9'
let g:fuf_modesDisable = ['mrucmd']
nmap \ :FufCoverageFile<cr>
nmap <leader>f :FufMruFile<cr>
nmap <leader>d :FufDir<cr>

Bundle 'vim-powerline'
let g:Powerline_symbols = 'compatible'

Bundle 'vim-repeat'
Bundle 'vim-supertab'
Bundle 'vim-surround'
Bundle 'vim-vividchalk'
Bundle 'YouCompleteMe'
