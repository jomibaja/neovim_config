"Config Nvim

syntax on
syntax enable

set number
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set wrap
set incsearch
set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4
set smartindent
set splitbelow
set splitright


call plug#begin('~/.local/share/nvim/plugged')

"Temas y Status bar

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'herringtondarkholme/yats.vim'
Plug 'luochen1990/rainbow'
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'

"Git
Plug 'tpope/vim-fugitive'

"IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'yuezk/vim-js' "sintaxis js
Plug 'maxmellon/vim-jsx-pretty' "sintax para react 
Plug 'scrooloose/nerdcommenter'
"Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'

"Autocomplete
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'j5shi/commandlinecomplete.vim'



call plug#end()

if !has('gui_running')
  set t_Co=256 
endif

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

let mapleader=" "

"Rainbow configutarion"
let g:rainbow_active = 1

"Abrir automaticamente NERDTree cuando abrimos vim
autocmd vimenter * NERDTree"

"Cerrar vim cuando solo queda NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Cerrar NERDTree cuando abro archivo
let NERDTreeQuitOnOpen=1

"Mapear Atajos
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>cc <Plug>NERDCommenterToggle
nmap <Leader>cu <Plug>NERDCommenterUncomment
vmap <Leader>cc <Plug>NERDCommenterToggle

"Remaps, this is where the magic of vim happends
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR> 
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

"Map para abrir el buscador de archivos
map <Leader>p :Files<CR>

"Atajos git

"Git status
nmap <Leader>gs :G<CR>
"Git add
nmap <Leader>ga :Gwrite<CR>
"Git commit
nmap <Leader>gc :Git commit<CR>
"Git blame me abre ventana vertical para ver por cada linea su commit
nmap <Leader>gb :Git blame<CR> 
"Git log
nmap <Leader>gl :Git log<CR> 

"Terminal
"nmap <Leader>t :FloatermNew<CR>

"Atajos para guardar y cerrar
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


" Emmet Configuration
let g:user_emmet_leader_key=','

" Use deoplete
let g:deoplete#enable_at_startup=1


"coc Config
let g:coc_global_extensions = [
  \ 'coc-emoji',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \ 'coc-tslint',
  \ 'coc-tslint-plugin',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-pyls',
  \ 'coc-yaml',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ ]

" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gh <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Trigger configuration. UtilSnipens
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
