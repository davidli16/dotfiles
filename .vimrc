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
set t_Co=256
color jellybeans
hi ColorColumn ctermbg=234 guibg=#1c1c1c
hi OverLength ctermbg=red ctermfg=white guibg=#592929
hi VertSplit ctermbg=237 guibg=#3a3a3a
match OverLength /\%101v.\+/
set fillchars+=vert:\ 

" === Ignore ===

set wildignore+=*.pyc
set wildignore+=*/out/*,*/build/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/node_modules/*

" === Plugins ===
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-dispatch'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_auto_trigger = 0
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

Plugin 'mileszs/ack.vim'
nmap <leader>a :Ack!<space>
let g:ack_use_dispatch = 1
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

Plugin 'syntastic'
nmap <leader>l :SyntasticCheck<cr>

" Disable active linting
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_python_checkers = ['pylint']

call vundle#end()
