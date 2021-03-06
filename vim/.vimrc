" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
"let g:skip_defaults_vim = 1

" ******************************************************
" ***************       Plugins       ******************
" ******************************************************

set nocompatible	" required
filetype off		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path were vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'kien/ctrlp.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

Bundle 'Valloric/YouCompleteMe'
"Plugin 'vim-syntastic/syntastic'

Plugin 'chrisbra/csv.vim'

" python folder and indenter
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

" c plugin
" Plugin 'vim-scripts/c.vim'

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'wikitopian/hardmode'

" processing plugin
" Plugin 'sophacles/vim-processing'

" for latex editing
Plugin 'lervag/vimtex'

" for i3 config syntax highlighting
Plugin 'mboughaba/i3config.vim'

Plugin 'sjl/gundo.vim'

" Plugin 'tweekmonster/django-plus.vim'

Plugin 'chriskempson/base16-vim'

Plugin 'SirVer/ultisnips'

Plugin 'xuhdev/indent-java.vim'
" All of your plugins must be added before the following line
call vundle#end()	" required
filetype plugin indent on " required

" ******************************************************
" ***************    End of Plugins   ******************
" ******************************************************

" remapping leader
let mapleader = ","

" configuration of plugins
let g:SimpylFold_docstring_preview=1

let g:ycm_autoclose_preview_window_after_completion=1
lmap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_hilight_all=1

let NERDTreeIgnore=['\.pyc&', '\~$'] "ignore files in NERDTree

" airline config
set laststatus=2 " Always display statusline in all windows
set showtabline=2 " Always displays the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

let g:airline_powerline_fonts=1

let g:airline_theme='base16_seti'

map <F3> :NERDTreeToggle<CR>

nnoremap <F5> : GundoToggle<CR>

let g:C_UseTool_cmake   = 'yes'
let g:C_UseTool_doxygen = 'yes'
let g:C_MapLeader = ','

let g:UltiSnipsExpandTrigger="<c-,>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"


" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set showtabline=0 "hides the top bar of vim

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set autochdir
set autoindent

set shiftwidth=4
set tabstop=4
set softtabstop=4

"setting the numberline
set number relativenumber
set nonumber norelativenumber "turn hybrid line numbers off
set number! relativenumber! "toggle hybrid line numbers


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" split navigations
nnoremap <C-J> <C-W><c-J>
nnoremap <C-K> <C-W><c-K>
nnoremap <C-L> <C-W><c-L>
nnoremap <C-H> <C-W><c-H>

" enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with spacebar
nnoremap <space> za

" enable proper PEP 8 indentation
au BufNewFile,BufRead *.py
	\set tabstop=4
	\set softtabstop=4
	\set shiftwidth=4
	\set textwidth=79
	\set expandtab
	\set autoindent
	\set fileformat=unix

" set indentation for some languages
au BufNewFile,BufRead *.js, *.html, *.css, *.json, *.xml
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

set encoding=utf-8

set backspace=2

" Make the 81st column stand out
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)
