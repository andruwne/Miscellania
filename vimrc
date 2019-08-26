set encoding=utf-8
scriptencoding utf-8
set directory^=$HOME/.vimfiles/swap//

runtime! ~/vimfiles/autoload/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'	
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end()

if exists('+colorcolumn')
	set colorcolumn=80
endif

colorscheme desert
syntax on
filetype plugin indent on
set nu
set ruler
set hidden

packadd! matchit
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Airline
let g:airline#extensions#tabline#enabled = 1

" Nerd tree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Quickly handle buffers
noremap <C-o> :bprevious<CR>
noremap <C-p> :bnext<CR>
noremap <C-d> :bn <bar> :bd #<CR>

" Show whitespace
set lcs=tab:..,trail:_,nbsp:~,precedes:<,extends:>
noremap <C-i> :set list!<CR>

" Toggle git gutter
map <C-g> :GitGutterToggle<CR>

" Not sure where I found these
" nnoremap <expr> j v:count ? 'j' : 'gj'
" nnoremap <expr> k v:count ? 'k' : 'gk'

" gvim visual settings
if has('gui_running')
	set lines=50 columns=160
	set guifont=Source_Code_Pro:h10:cANSI:qDRAFT
	set backspace=2
	set backspace=indent,eol,start
	set guioptions-=T
	set guitablabel=expand('%:t!')
endif
