"--------------------------------------------------------------------------------------------------------------"
" General Settings
"--------------------------------------------------------------------------------------------------------------"

set number 		" set line numbers
set nocompatible	" required
set backspace=2		" delete in insert mode deletes characters
syntax on
set hidden		" dont have to save when switching file buffer   
imap jj <ESC>  

" where splits occur when using sp and vs
set splitbelow
set splitright

" Enable folding(collapse a section of code like a method or class)
set foldmethod=indent
set foldlevel=99

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred

" Set utf-8 encoding
set encoding=utf-8

"--------------------------------------------------------------------------------------------------------------"
" Vundle
"--------------------------------------------------------------------------------------------------------------"

filetype off		" Required for vundle shorturl.at/cCNS6

" set the runtime path to include vundle and initialize https://medium.com/usevim/vim-101-runtimepath-83194d411b0a
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim', { 'name': 'dracula' }

" ...

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required

" --- YCM global settings ---

" Close auto complete window when done using it
let g:ycm_autoclose_preview_window_after_completion=1

" shortcut for goto definition
let mapleader =" "
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" syntastic settings
let python_highlight_all=1
let g:syntastic_aggregate_errors = 1

" set t_Co=256

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
colorscheme dracula
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'

"--------------------------------------------------------------------------------------------------------------"
" Key Maps
"--------------------------------------------------------------------------------------------------------------"

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
