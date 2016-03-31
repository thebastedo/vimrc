" VUNDLE STUFF

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntax Highlighters

" JAVASCRIPT
" https://github.com/pangloss/vim-javascript
Plugin 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'

" JSX
" https://github.com/mxw/vim-jsx
Bundle 'mxw/vim-jsx'

" JSON
" https://github.com/elzr/vim-json
Plugin 'elzr/vim-json'

" CSS/SCSS
" https://github.com/cakebaker/scss-syntax.vim
Plugin 'cakebaker/scss-syntax.vim'

" LESS
Plugin 'groenewege/vim-less'

" Syntastic
Plugin 'scrooloose/syntastic'

" Coffeescript syntax
Plugin 'kchmck/vim-coffee-script'

" Emblem syntax
Bundle 'heartsentwined/vim-emblem'

" Tools

" Airline (powerline but in vim )
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Emmet
" Awesome html shortcut tool
" http://mattn.github.io/emmet-vim/
Plugin 'mattn/emmet-vim'

" NERDTree
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'

" Nerdtree Tabs
" https://github.com/jistr/vim-nerdtree-tabs
Bundle 'jistr/vim-nerdtree-tabs'

" Nerdtree git
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Fugitive
" git://github.com/tpope/vim-fugitive.git
Plugin 'tpope/vim-fugitive.git'

" Neocomplcache
" https://github.com/Shougo/neocomplcache.vim
Plugin 'Shougo/neocomplcache.vim'

" Color themes
Plugin 'mhartington/oceanic-next'
Plugin 'trusktr/seti.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'crusoexia/vim-monokai'

" End Plugins
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Syntax
syntax on
syntax enable

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" enable NeoComplete with Cache 
let g:neocomplcache_enable_at_startup = 1

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Color theme
set background=dark
set t_Co=256
"colorscheme onedark
"colorscheme OceanicNext
colorscheme monokai
set background=dark

" General
set history=700
set autoread
set nobackup
set noswapfile
set nowb

" Mouse in term
set mouse=a

" normal backspace
set backspace=2

" GUI Font
" Set extra options when running in GUI mode
if has('gui_running')
	set guifont=Source\ Code\ Pro\ for\ Powerline:h10
	set guioptions-=T
	set guioptions+=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

" Indent
set ai
set si
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Show Line Numbers
set nu

" Search
" ignore case
set ignorecase
" smart cases
set smartcase
" highlight search
set hlsearch
" browser style search
set incsearch
" show matches
set showmatch

" File
" use unix as standard
set ffs=unix,dos,mac

" Leader Mapping
let mapleader = ","
let g:mapleader = ","

" Aliases
" CWD
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Hiddens
map <leader>ll :setlocal list!<cr>

" Close current buffer
map <leader>bd :Bclose<cr>

" Close All Buffers
map <leader>ba :1,100 bd!<cr>

" Nerdtree toggle
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Fast save 
nmap <leader>w :w!<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Coding stuff
set colorcolumn=120
set listchars=eol:¬,tab:▸\ ,trail:~,extends:>,precedes:<

" File Types

" SCSS
au BufRead,BufNewFile *.scss set filetype=scss.css
autocmd FileType scss set iskeyword+=-

" Remember position in file
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.jsx :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.css :call DeleteTrailingWS()

" Functions

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
        exe "normal mz"
        %s/\s\+$//ge
        exe "normal `z"
endfunc

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
