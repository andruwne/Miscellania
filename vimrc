" # NOTES #
"
" = Mappings =
" map     is recursive
" noremap is not recursive
"
" Adding a mode letter lets it only apply in certain modes
" n normal
" v visual and select
" o operator-pending
" x visual
" s select
" i insert
" c command-line
" l insert, command-line, regexp-search (and others. Collectively called "Lang-Arg" pseudo-mode)
"
" So "nnoremap" means "only in normal mode non recursively map this to that"
"
" = Plugins =
" This vimrc uses the "Minimalist Vim Plugin Manager" https://github.com/junegunn/vim-plug
" Install plugins using ":PlugInstall"
"
" = Gvim =
" Settings only used in Gvim are defined under "gvim visual settings"

set encoding=utf-8
scriptencoding utf-8
set directory^=$HOME/.vimfiles/swap//

runtime! ~/vimfiles/autoload/plug.vim
call plug#begin('~/.vim/plugged')
	Plug 'adelarsq/vim-matchit'
	Plug 'mhinz/vim-startify'
	Plug 'scrooloose/nerdtree'
	Plug 'fatih/vim-go'
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tpope/vim-fugitive'
call plug#end()

" Show line at 80 characters for reference
if exists('+colorcolumn')
	set colorcolumn=80
endif

" Colorscheme
set background=dark
" colorscheme solarized
" autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme janah

syntax on
filetype plugin indent on
set nu
set ruler
set hidden
set mouse=a

set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Save close NERDTree on leaVE
autocmd VimLeave * NERDTreeClose

" Put NERDTree on right side
let g:NERDTreeWinPos = "right"

" Airline
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

" Nerd tree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Unmap Ex mode
map Q <nop>

" Shortcutting split navigation, saving a keypress:
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quickly handle buffers
nnoremap <C-o> :bprevious<CR>
nnoremap <C-p> :bnext<CR>
" Hides window
nnoremap <C-d> :hide<CR>
" Deletes buffer -> the same as :bdel
" nnoremap <C-d> :bn <bar> :bd #<CR>

" Close window
nnoremap <C-q> <C-w>q

" Highlight whitespace
set lcs=tab:..,trail:_,nbsp:~,precedes:<,extends:>
nnoremap <C-i> :set list!<CR>

" Toggle git gutter
map <C-g> :GitGutterToggle<CR>

" Better keyboard scrolling
" nnoremap <expr> j v:count ? 'j' : 'gj'
" nnoremap <expr> k v:count ? 'k' : 'gk'

" gvim visual settings
if has('gui_running')
	set lines=50 columns=160
	set guifont=Source_Code_Pro:h10:cANSI:qDRAFT
	set backspace=2
	set guioptions-=T
	set guitablabel=expand('%:t!')
endif
