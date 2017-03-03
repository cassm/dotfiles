set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'

"Plugin 'vim-scripts/ctags.vim'
"Plugin 'xolox/vim-easytags'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-misc'
Plugin 'airblade/vim-gitgutter'
Plugin 'kshenoy/vim-signature'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wesQ3/vim-windowswap'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-abolish'
"Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'Tabbi'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'easymotion/vim-easymotion'
Plugin 'tweekmonster/braceless.vim'
"Plugin 'goonzoid/vim-reprocessed'
Plugin 'sophacles/vim-processing'

call vundle#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
let mapleader = ";"
set splitbelow
set splitright
set laststatus=2
set number
set expandtab
set relativenumber
set number
set shiftwidth=4
set tabstop=4
set foldmethod=syntax
set foldlevelstart=20
set foldlevel=20
set backspace=indent,eol,start
set wildmenu
set wildmode=longest,list:full
filetype plugin indent on
syntax on
filetype on

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * match ExtraWhitespace /\s\+$\|\t\+/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\|\t\+/
au InsertLeave * match ExtraWhitespace /\s\+$\|\t\+/

autocmd FileType python BracelessEnable +indent +fold

"autocmd ColorScheme * highlight HighlightTabs ctermbg=red guibg=red
"autocmd ColorScheme * match HighlightTabs /\t+/

"fun! SetHighLightTabs()
    "if &ft == "make"
        "match HighlightTabs /\t\t\t\t\t\t\t/
    "else
        "match HighlightTabs /\t+/
    "endif
"endfun

"autocmd FileType * call SetHighLightTabs()
"autocmd FileType make match ExtraWhitespace /\t\t\t\t\t/

colorscheme lucius
set bg=dark

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
inoremap <C-J> <CR>{<CR>}<Up><CR>
nnoremap <C-J> o{<CR>}<Up><CR>
nnoremap <CR> i<CR><Esc>
nnoremap <Space> i<Space><Esc><Right>
vmap "'y "*y
map "'p :r!xclip -o <CR>
map <A-]> :vsp<CR>:exec("tag ".expand("<cword>")) "
nnoremap <T> :TagbarToggle<CR>

" Git yore fingers off them arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Why even is ex mode?
nnoremap Q <nop>

" Better hunk nav mapping
nmap ) <Plug>GitGutterNextHunk
nmap ( <Plug>GitGutterPrevHunk

" Vim annoyances
" stop cursor jumping when joining lines
nnoremap J mzJ`zdmz

set scrolloff=15
set autochdir

nnoremap Y y$

command Untrail %s/\s*$//
set virtualedit=block
