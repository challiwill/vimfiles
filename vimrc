"""
" Config inspired from https://realpython.com/vim-and-python-a-match-made-in-heaven/
" Using github.com/junegunn/vim-plug
" Also lots of inspiration from github.com/luan/vimfiles
"""

set nocompatible              " required
filetype off                  " required

" VimPlug config
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Add plugins here
" Install with :PlugInstall
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
" TODO configure or learn to use dandavison/delta
Plug 'dandavison/delta'
Plug 'elixir-lang/vim-elixir'
Plug 'jnurmine/Zenburn'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'
Plug 'nvie/vim-flake8'
Plug 'tmhedberg/SimpylFold'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-projectionist'
Plug 'vim-scripts/indentpython.vim'
" Plug 'vim-syntastic/syntastic'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all --system-libclang' }

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required


"""
" Custom settings
"""

"""
" Standard configurations
"""
nnoremap <space> za " Enable folding with the spacebar
let mapleader = "," " Remap leader key (default is '\')
set number          " Line numbering
set nowrap          " Line wrapping off
" Search settings
set ignorecase
set smartcase  " Non-case sensitive search
set hlsearch
nnoremap <leader>c :nohl<CR> " leader-c to remove search highlighting
" Sounds
set noerrorbells
set novisualbell
" Default split open
set splitright
" Save on <enter> (carriage return)
nnoremap <unique> <expr> <CR> empty(&buftype) ? ':w<CR>' : '<CR>'
" Open in same directory
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"""
" Plugin configurations
"""

" Settings for ctrlp
" suggested by https://github.com/ctrlpvim/ctrlp.vim/readme.md
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" YCM window close after completion
let g:ycm_autoclose_preview_window_after_completion=1
" YCM go to definition remap
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Color scheme controls
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
" Toggle solarized light/dark
call togglebg#map("<F5>")

" Remap for projectionist (go to test)
nnoremap gt :A<CR>


"""
" Python configuration
"""

au BufNewFile,BufRead *.py
    \ set foldmethod=indent |
    \ set foldlevel=99 |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set encoding=utf-8

" Flag unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Syntax highlighting
let python_highlight_all=1
syntax on

