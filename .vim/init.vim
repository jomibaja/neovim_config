
syntax on

set number
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
syntax enable
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
so ~/.vim/plugins.vim

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



call plug#end()

if !has('gui_running')
  set t_Co=256 
endif

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
let NERDTreeQuitOnOpen=1

let mapleader=" "

"Rainbow configutarion"
let g:rainbow_active = 1

"Abrir automaticamente NERDTree cuando abrimos vim
autocmd vimenter * NERDTree"

"Cerrar vim cuando solo queda NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Mapear Atajos
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>as :NERDTreeFind<CR>
nmap <Leader>cc <Plug>NERDCommenterToggle
nmap <Leader>cu <Plug>NERDCommenterUncomment
vmap <Leader>cc <Plug>NERDCommenterToggle
"nmap <Leader>t :term<CR>
"nmap <Leader>f :Files<CR>

"Atajos git
"Git status
nmap <Leader>gs :G<CR>
"Git add
nmap <Leader>ga :Gwrite<CR>
"Git commit
nmap <Leader>gc :Gcommit<CR>
"Gblame me abre ventana vertical para ver por cada linea su commit
nmap <Leader>gb :Gblame<CR> 

"Terminal
nmap <Leader>t :term<CR>

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
  "\ 'coc-eslint',
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
