call plug#begin('~/.local/share/nvim/plugged')

Plug 'ap/vim-buftabline'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'

call plug#end()

" code completion via ycm
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_conf.py'
nnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>

filetype plugin indent on
syntax enable

" styles
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif
syntax on
colorscheme onedark
set title
set number
set laststatus=2

" soft (80, vertical line) and hard (100, red bg) character caps
set colorcolumn=80
highlight ColorColumn ctermbg=8

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%100v.\+/

" spaces instead of tabs
set tabstop=4
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4

" misc
set showcmd
set autoindent
set undolevels=1000
set incsearch                                   " incremental search
set hlsearch                                    " highlight search
set hidden                                      " keep buffer undo history
set ignorecase                                  " case insensitive search
set smartcase                                   " case insensitive search if all lower case

" display unncessary whitespace & tabs
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set iskeyword+=.

" space toggles off search highlight
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" save as root
cmap w!! w !sudo tee >/dev/null %

" keymap conf
map <Leader>, :bp<CR>                           " prev buffer
map <Leader>. :bn<CR>                           " next buffer
map <S-Tab> :lcl<CR>:bn<CR>                     " close quickfix, next buffer
map <Leader><Leader> :only<CR>                  " close help buffer
map <Leader>jf :%!python -m json.tool<CR>

" paste
set pastetoggle=<F3>

" toggle line numbering
nnoremap <silent> <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" plugins
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\vvenv\d*$',
    \ 'file': '\v[\/]\.(git|hg|svn|pyc)$',
    \ }
let g:ale_linters = {
    \   'python': ['flake8'],
    \ }
let g:ale_python_flake8_options = "--config test-conf/flake8.ini"
let g:ale_python_flake8_change_directory = 0
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
