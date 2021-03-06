" ===== Plugin Management =====
" Automatically install plug for neovim
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Automatically install missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.local/share/nvim/site/plugged')

" Color Schemes
" https://github.com/kaicataldo/material.vim
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Automatically insert ending quotes, parentheses, braces, etc.
" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

" Visualize undo history, making it easier to browse and switch between different undo branches
" https://github.com/mbbill/undotree
Plug 'mbbill/undotree'

" Fuzzy finder in Vim, used to quickly search files
" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Lightweight status/tabline
" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ===== General (Neo)Vim Settings =====
syntax on
set nohlsearch                  " No search highlighting
set incsearch                   " Incremental searching
set ignorecase                  " Ignore case in search patterns
set smartcase                   " Override ignorecase if the search pattern contains uppercase letters
set autowrite                   " Automatically save files when switching buffers
set autoindent                  " Automatically indent
set smartindent                 " Smart indenting on new lines, i.e. indentation after brackets, etc
set expandtab                   " Convert tabs to spaces
set shiftround                  " When shifting lines, round the indentation to the nearest multiple of shiftwidth
set shiftwidth=4                " Indent using n spaces
set tabstop=4                   " Indent using n spaces
set number                      " Display line numbers
set titlestring=%t              " Show the name of the file as the window title
set title                       " Apply the above titlestring
set ruler                       " Display the current cursor position
set encoding=utf-8              " Use unicode encoding
set nowrap                      " Dont wrap text, let it go off screen
set textwidth=0                 " Disable buffer text breaking/hard wrapping
set scrolloff=8                 " Keep at least n lines above and below the cursor
set sidescrolloff=5             " Keep at least n columns left and right of the cursor
set laststatus=2                " Always display the status bar
set wildmenu                    " Display command line's tab complete options as a menu
set cursorline                  " Highlight the current cursor line
set noerrorbells                " No beeps
set mouse=a                     " Enable mouse for scrolling and resizing
set backspace=indent,eol,start  " Allow backspacing over indentation, line breaks, and insertion start
set confirm                     " Show a confirmation dialog when closing an unsaved file
set noswapfile                  " Disable swap file
set nobackup                    " Dont create backups when overwriting files
set undofile                    " Automatically save undo history to an undo file
set undodir=~/.config/nvim/undo " Directory to store undo files
set termguicolors               " Enable 24-bit color

set formatoptions-=cro          " Don't automatically format text
autocmd FileType * set formatoptions-=cro

" Allows filetype-specific configs in ~/.config/nvim/after/ftplugin/language.vim
filetype plugin on

" ===== Theme / Color Scheme Settings =====

set background=dark

" Options provided by the vim material theme:
"   default, default-community, palenight, palenight-community,
"   ocean, ocean-community, lighter, lighter-community,
"   darker, darker-community
let g:material_theme_style = 'darker-community'
let g:material_terminal_italics = 1

" Stop the color scheme from changing the background color
" highlight Normal guibg=NONE ctermbg=NONE

colorscheme material

" Use the airline theme included with the vim material theme
let g:airline_theme = 'material'

" ----- Keymaps ---------------------------------------------------------------
let mapleader = "\<Space>"

" Shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map F5 to open undotree
nnoremap <F5> :UndotreeToggle<CR>
