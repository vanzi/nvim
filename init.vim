call plug#begin('~/.local/share/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-buftabline'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

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

" save as root
cmap w!! w !sudo tee >/dev/null %

" space toggles off search highlight
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" keymap conf
nnoremap <C-p> :Files<CR>
nnoremap <leader>d :YcmCompleter GoTo<CR>
nnoremap <leader>D :YcmCompleter GoToDefinition<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
nnoremap <Leader>, :bp<CR>
nnoremap <Leader>. :bn<CR>
nnoremap <S-Tab> :lcl<CR>:bn<CR>
nnoremap <Leader><Leader> :only<CR>
nnoremap <Leader>jf :%!python -m json.tool<CR>
nnoremap <Leader>s :Isort -sp test-conf<CR>

" paste
set pastetoggle=<F3>

" toggle line numbering
nnoremap <silent> <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" plugins
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_python_flake8_options = '--config test-conf/flake8.ini'
let g:ale_python_flake8_change_directory = 0
let g:ale_python_autopep8_options = '--global-config test-conf/flake8.ini'
let g:ale_python_isort_options = '-sp ' . fnamemodify('test-conf', ':p')
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['autopep8', 'isort']}

let g:airline#extensions#ale#enabled = 1

" alternative for vim-buftabline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_conf.py'
