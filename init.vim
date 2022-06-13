let mapleader = " "
nnoremap <leader>ev :exec 'tabedit' stdpath('config').'/init.vim'<CR>
nnoremap <leader>so :source %<CR>
nnoremap <leader>so :source %<CR>

set number
set relativenumber

call plug#begin()
"Plug 'junegunn/fzf' 👀
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()


