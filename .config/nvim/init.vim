set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

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

" === Styles ===
color jellybeans
set t_Co=256
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
