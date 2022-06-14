let mapleader = " "
nnoremap <leader>ev :exec 'tabedit' stdpath('config').'/init.vim'<CR>
nnoremap <leader>so :source %<CR>

set number
set relativenumber
set showmatch
set splitbelow
set splitright
set ignorecase
set smartcase
set gdefault

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
Plug 'mhinz/vim-startify'
call plug#end()

syntax enable
filetype plugin indent on
let g:syntastic_yaml_checkers = ['yamllint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:webdevicons_enable_startify = 1
let g:ascii = [
  \ '        __',
  \ '.--.--.|__|.--------.',
  \ '|  |  ||  ||        |',
  \ ' \___/ |__||__|__|__|',
  \ ''
  \]

let g:startify_custom_header = startify#pad(g:ascii)

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

autocmd VimEnter * RainbowToggle 
autocmd VimEnter * GitGutterEnable

