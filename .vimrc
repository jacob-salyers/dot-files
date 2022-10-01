if has("terminfo")
	set t_Co=16
	set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
	set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
else
	set t_Co=16
	set t_Sf=[3%dm
	set t_Sb=[4%dm
endif
set nocompatible
filetype off 
syntax on
set smartindent
set path+=**
set wildmenu
set breakindent
set wrap
set linebreak
set nolist
set number
set shiftwidth=4
set tabstop=4
set softtabstop=4
set rtp+=~/.vim/bundle/Vundle.vim
set term=screen-256color
set tags=tags;/
set hlsearch
set showcmd
set ignorecase
set smartcase
set backspace=indent,eol,start
colorscheme industry
command! MakeTags !ctags -R .
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'hdima/python-syntax'
Plugin 'tpope/vim-dispatch'
Plugin 'leafgarland/typescript-vim'
Plugin 'itchyny/calendar.vim'
Plugin 'jceb/vim-orgmode'
Plugin 'jpalardy/vim-slime'
call vundle#end()
filetype plugin indent on
source ~/.vim/plugin/matchit.vim
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Tab> i_<Esc>r
nnoremap <S-Tab> a_<Esc>r
nnoremap \b :b<Space>
nnoremap \x :up\|noh<CR>

highlight ColorColumn ctermbg=1
set colorcolumn=70
set relativenumber
set splitright
set splitbelow

let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 15

let g:slime_target = "vimterminal"
let maplocalleader = "-"

set undofile
set undodir=~/.vim/undodir

function ToTsv ()
	setlocal noexpandtab
	setlocal shiftwidth=20
	setlocal softtabstop=20
	setlocal tabstop=20
	setlocal colorcolumn=0
	setlocal nowrap
	setlocal scrollopt=hor
	split
	let @f='gg1<C-w>_<C-w>j'
	norm @f
	
	set scrollbind
	let @f='<C-w>k'
	norm @f
	set scrollbind
	let @f='<C-w>j'
	norm @f
endfunction

if expand('%:e') == 'tsv'
	call ToTsv()
endif

if expand('%:e') == 'lisp' || expand('%:e') == 'html'
	setlocal shiftwidth=2
	setlocal softtabstop=2
	setlocal tabstop=2
    setlocal expandtab
endif


au BufRead,BufNewFile *.ts setlocal syntax=typescript
