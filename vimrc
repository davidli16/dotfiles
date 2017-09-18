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
set ttyfast
set pastetoggle=<f8>
set lazyredraw

" === VIM User Interface ===
" set mouse=a
set backspace=indent,eol,start
set colorcolumn=81
set completeopt=longest,menuone
set laststatus=2
set list
set listchars=tab:·-,trail:-
set matchtime=5
set nostartofline
set relativenumber
set scrolloff=5
set showcmd
set sidescrolloff=5
set splitbelow
set splitright
set wildmenu

syntax enable

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
set smartindent
set expandtab
set nowrap
set shiftwidth=4
set softtabstop=4
set tabstop=4
set encoding=utf-8

" === Key Bindings ===
let mapleader = ","

nnoremap ; :
inoremap jk <esc>
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
set t_Co=256
color jellybeans
hi Normal guibg=none ctermbg=none
hi NonText guibg=none ctermbg=none
hi LineNr guibg=none ctermbg=none
hi SignColumn guibg=none ctermbg=none
hi CursorLine guibg=none ctermbg=none
hi Folded guibg=none ctermbg=none
hi ColorColumn ctermbg=234 guibg=#1c1c1c
" hi OverLength ctermbg=red ctermfg=white guibg=#592929
hi VertSplit ctermbg=237 guibg=#3a3a3a
" match OverLength /\%101v.\+/
set fillchars+=vert:\ 

" === Ignore ===

set wildignore+=*.pyc
set wildignore+=*/out/*,*/build/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/node_modules/*

" === Plugins ===

set shell=bash
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#ale#enabled = 1

Plugin 'tpope/vim-dispatch'

" Plugin 'Valloric/YouCompleteMe'
" let g:ycm_auto_trigger = 0
Plugin 'myusuf3/numbers.vim'

Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

Plugin 'ctrlpvim/ctrlp.vim'
nmap \ :CtrlP<cr>
nmap <leader>f :CtrlPMRU<cr>
nmap <leader>C :CtrlPClearCache<cr>
" Local working directory: Git > Subdirectory > Directory
let g:ctrlp_workking_path_mode = 'ra'
" Ignore gitignore files when searching
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

Plugin 'L9'

Plugin 'sjl/gundo.vim'
nnoremap <leader>u :GundoToggle<cr>

Plugin 'dyng/ctrlsf.vim'
nmap <leader>a :CtrlSF<space>
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_auto_close = 0
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_regex_pattern = 1

Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
let g:vim_jsx_pretty_colorful_config = 1

Plugin 'w0rp/ale'
let g:ale_sign_column_always = 1
let g:ale_linters = {
\    'python': ['pylint']
\}

Plugin 'noahfrederick/vim-skeleton'
nmap <leader>t :SkelInsert!<space>

" Allow for per-directory .vimrc configurations
Plugin 'MarcWeber/vim-addon-local-vimrc'

call vundle#end()
