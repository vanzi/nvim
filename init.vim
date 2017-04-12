" dein -----------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " plugins
  call dein#add('ap/vim-buftabline')
  call dein#add('joshdick/onedark.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('vim-syntastic/syntastic')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" autoinstall
if dein#check_install()
  call dein#install()
endif
" dein -----------------------------

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
map <Leader>, :bp<CR>
map <Leader>. :bn<CR>
map <S-Tab> :lcl<CR>:bn<CR>
map <Leader><Leader> :only<CR>
map F :lne<CR>
map <Leader>jf :%!python -m json.tool<CR>

" paste
set pastetoggle=<F3>

" toggle line numbering
nnoremap <silent> <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" plugins
let g:lightline = {'colorscheme': 'onedark'}
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\vvenv\d*$',
    \ 'file': '\v[\/]\.(git|hg|svn|pyc)$',
    \ }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ["pylama"]

" file types
au BufNewFile,BufRead *.ejs set filetype=html

if filereadable('.vim.local')
    so .vim.local
endif
