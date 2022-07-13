"------------------------------------------------------------------------------
" General Settings
"------------------------------------------------------------------------------

set noswapfile		" dont create swap files
set noerrorbells	" no sound effects in vim cause they are uber annoying
set number 		" set line numbers
set relativenumber "set relative line numbering"
set nocompatible	" required
set backspace=2		" delete in insert mode deletes characters
syntax on
set hidden		" dont have to save when switching file buffer
imap jj <ESC>

" where splits occur when using sp and vs
set splitbelow
set splitright

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Enable folding(collapse a section of code like a method or class)
set foldmethod=indent
set foldlevel=99

" Set utf-8 encoding
set encoding=utf-8

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
"------------------------------------------------------------------------------
" Vundle
"------------------------------------------------------------------------------

filetype off		" Required for vundle shorturl.at/cCNS6

" set the runtime path to include vundle and initialize
" https://medium.com/usevim/vim-101-runtimepath-83194d411b0a
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'nvie/vim-flake8'
Plugin 'preservim/nerdtree'
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
Plugin 'skywind3000/asyncrun.vim'
Plugin 'conornewton/vim-pandoc-markdown-preview'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'lifepillar/vim-gruvbox8'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'lewis6991/gitsigns.nvim'
" ...

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required


" syntastic settings
let python_highlight_all=1
let g:syntastic_aggregate_errors = 1

set t_Co=256

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
colorscheme gruvbox8
set background=dark
let g:airline_theme='gruvbox8'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Show formatoption next to filetype in airline statusline
function Fo()
	return &fo
endfunction
call airline#parts#define_function('for_o', 'Fo')
let g:airline_section_x= airline#section#create_right(['for_o', 'filetype'])
" let g:buffet_powerline_separators = 1
" let g:buffet_tab_icon = "\uf00a"
" let g:buffet_left_trunc_icon = "\uf0a8"
" let g:buffet_right_trunc_icon = "\uf0a9"

" Remove >> << symbols from lh refactor autgenerate
" let b:usemarks=0
" let g:use_old_bracketting_macros=1
" let g:marker_define_jump_mappings=1

let g:md_pdf_viewer="evince"
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"------------------------------------------------------------------------------
" Key Maps
"------------------------------------------------------------------------------
" Leader mapped to <SPACE>
let mapleader =" "

" Hard Mode Key Mapping -- Disable arrow keys in all modes
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <PageUp> <Nop>
nnoremap <PageDown> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <PageUp> <Nop>
vnoremap <PageDown> <Nop>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" shortcut for goto definition
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

" New line without entering insert mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" Coc.vim mappings
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Format entire file
command! -nargs=0 Format :call CocActionAsync('format')
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Autocompletetion using Tab
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()

" TODO Add Mapping to create a new directory using NERDTree
" TODO Add Mapping to move(rename) a directory using NERDTree
" Open NERDTree Explorer on left
nnoremap <Leader>e :NERDTreeToggle<CR>

" Buffer Navigation
nnoremap L :bn<CR>
nnoremap H :bp<CR>
nnoremap <Leader>q :bd<CR>

" FZF Key Binding
nnoremap <Leader>f :Files<CR>

