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

call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-dispatch'

Plug 'myusuf3/numbers.vim'

Plug 'raimondi/delimitmate'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nmap \ :Files<cr>
nmap <leader>f :History<cr>
nmap <leader>s :Rg<space>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

Plug 'sjl/gundo.vim'
nnoremap <leader>u :GundoToggle<cr>

Plug 'sheerun/vim-polyglot'

Plug 'noahfrederick/vim-skeleton'
nmap <leader>t :SkelInsert!<space>

" Allow for per-directory .vimrc configurations
Plug 'MarcWeber/vim-addon-local-vimrc'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

call plug#end()
