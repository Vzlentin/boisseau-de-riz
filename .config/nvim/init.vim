" Neo Unbloated Vim Config

" Plugins
call plug#begin('$HOME/.config/nvim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'ap/vim-css-color'
call plug#end()

" General
set clipboard+=unnamedplus
set mouse=a
set nohlsearch
set number
set encoding=utf-8

" No backup
set nobackup
set nowb
set noswapfile

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'

" NERDTree
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Colors
highlight LineNr ctermfg=white

" Remaps
map <space> /
nnoremap S :%s//g<Left><Left>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap H :tabprevious<CR>
nnoremap L :tabnext<CR>
