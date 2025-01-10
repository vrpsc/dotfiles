" ============================
" PLUGIN MANAGER AUTODOWNLOAD
" ============================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ========
" PLUGINS
" ========
call plug#begin('~/.vim/plugged')

Plug 'voldikss/vim-floaterm'
Plug 'itchyny/lightline.vim'
if !has('gui_running')
    set t_Co=256
endif
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'rhysd/vim-clang-format'
Plug 'Townk/vim-autoclose'
Plug 'vim-python/python-syntax'
Plug 'ryanoasis/vim-devicons'
Plug 'cespare/vim-toml'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

" =============
" ALE Settings
" =============
" Toggle ALE linting.
let g:ale_pattern_options_enabled = 1
let g:ale_pattern_options = { '\.h': { 'ale_linters': { 'cpp': ['clangd', 'cc', 'gcc', 'clang'] } } }
let g:ale_linters = {
\   'c': ['ccls', 'clangtidy', 'cc', 'gcc', 'clang'],
\   'cpp': ['clangd', 'cc', 'gcc', 'clang'],
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'eslint'],
\   'javascriptreact': ['eslint'],
\   'typescriptreact': ['tsserver', 'eslint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'c': ['clangtidy'],
\   'cpp': ['clangd'],
\}
let g:ale_completion_autoimport = 1
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1
let g:ale_floating_preview = 1
let g:ale_set_balloons = 1


" ====================
" indentLine Settings
" ====================
let g:indentLine_char = '│'


" =====================
" FLOATERM KEYMAPPINGS
" =====================
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
let g:floaterm_title = ''


" ===================
" LightLine Settings
" ===================
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat'
      \ }
      \ }
let g:lightline.component_expand = {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_infos': 'lightline#ale#infos',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ }
let g:lightline.component_type = {
  \   'linter_checking': 'right',
  \   'linter_infos': 'right',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'right',
  \ }
let g:lightline.active = {
  \   'right': [
  \     [
  \       'linter_errors',
  \       'linter_warnings',
  \       'linter_ok'
  \     ],
  \     [ 'lineinfo' ],
  \     [ 'fileformat', 'fileencoding', 'filetype' ],
  \   ]
  \ }
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e\ "
let g:lightline#ale#indicator_ok = "\uf00c"


" ==================
" Devicons Settings
" ==================
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction


" =======================
" vim-autoclose Settings
" =======================
let g:AutoClosePairs = "() [] {} ` \" ' <>"


" ========================
" vim-jsx-pretty Settings
" ========================
let g:vim_jsx_pretty_colorful_config = 1
