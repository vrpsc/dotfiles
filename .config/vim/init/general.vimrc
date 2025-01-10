" Colors and syntaxing
syntax on
set background=dark
colorscheme hybrid

" Column and numbering
set colorcolumn=100
set number relativenumber

" Spacing
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent

" Undo options
set undodir=$HOME/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000

" Swap file
set noswapfile

" Wildmenu
set wildmenu
set wildignore=*.o,*~,*.pyc
set wildmode=list:longest,full

" Status Line
set ruler
set showcmd
set modeline
set encoding=utf-8
set laststatus=2
set noshowmode

" Split Screen
set splitright
set splitbelow

" Cursor Settings
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Netrw Settings
let g:netrw_banner = 0
let g:netrw_preview = 1
let g:netrw_winsize = 30
let g:netrw_liststyle = 3
let g:netrw_keepdir = 0
let g:netrw_localcopydircmd = 'cp -r'
