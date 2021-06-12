
call plug#begin('~/.local/share/nvim/plugged')

"Temas y Status bar

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'herringtondarkholme/yats.vim'
Plug 'luochen1990/rainbow'
Plug 'ap/vim-css-color'

"Git
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

"IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mattn/emmet-vim'
Plug 'yuezk/vim-js' "sintaxis js
Plug 'maxmellon/vim-jsx-pretty' "sintax para react 
Plug 'scrooloose/nerdcommenter'
Plug 'j5shi/commandlinecomplete.vim'

"Autocomplete
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'shougo/deoplete.nvim'
"Plug 'kien/ctrlp.vim'
"Plug 'jelera/vim-javascript-syntax'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'


call plug#end()
