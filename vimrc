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
Plugin 'neoclide/coc.nvim'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'morhetz/gruvbox'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" ...

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required


" syntastic settings
let python_highlight_all=1
let g:syntastic_aggregate_errors = 1

" set t_Co=256

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
colorscheme dracula
set background=dark
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'

" Remove >> << symbols from lh refactor autgenerate
let b:usemarks=0
let g:use_old_bracketting_macros=1
let g:marker_define_jump_mappings=1

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"--------------------------------------------------------------------------------------------------------------"
" Key Maps
"--------------------------------------------------------------------------------------------------------------"
" Leader mapped to <SPACE>
let mapleader =" "

" split navigations
nnoremap <leader><C-J> <C-W><C-J>
nnoremap <leader><C-K> <C-W><C-K>
nnoremap <leader><<C-L> <C-W><C-L>
nnoremap <leader><<C-H> <C-W><C-H>

" shortcut for goto definition
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

" New line without entering insert mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" TODO Add Mapping to create a new directory using NERDTree
" TODO Add Mapping to move(rename) a directory using NERDTree
