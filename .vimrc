set nocompatible              " be iMproved, required
filetype plugin on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'

"Plugin 'vim-scripts/ctags.vim'
"Plugin 'xolox/vim-easytags'
Plugin 'bling/vim-airline'
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
Plugin 'camelcasemotion'
Plugin 'jewes/Conque-Shell'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-surround'
Plugin 'repeat.vim'
Plugin 'dkarter/bullets.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'LarsEKrueger/pandoc-vimwiki'

call vundle#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'
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
set incsearch
set background=dark
filetype plugin indent on
syntax on
filetype on
let g:vimwiki_folding = 'syntax'

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * match ExtraWhitespace /\s\+$\|\t\+/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\|\t\+/
au InsertLeave * match ExtraWhitespace /\s\+$\|\t\+/

autocmd FileType python BracelessEnable +indent +fold


let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" allows incsearch highlighting for range commands
cnoremap $t <cr>:t''<cr>
cnoremap $t <cr>:t''<cr>
cnoremap $m <cr>:m''<cr>
cnoremap $m <cr>:m''<cr>
cnoremap $d <cr>:d<cr>``

nnoremap <S-h> :tabprevious<cr>
nnoremap <S-l> :tabnext<cr>

nnoremap <c-left> :tabprevious<cr>
nnoremap <c-right> :tabnext<cr>
nnoremap <silent> <a-left> :execute 'silent! tabmove ' . (tabpagenr()-2)<cr>
nnoremap <silent> <a-right> :execute 'silent! tabmove ' . tabpagenr()<cr>
inoremap <c-j> <cr>{<cr>}<up><cr>
nnoremap <leader><space> o{<cr>}<up><cr>
nnoremap <space> i<space><esc><right>
vmap "'y "*y
map "'p :r!xclip -o <cr>
map <a-]> :vsp<cr>:exec("tag ".expand("<cword>")) "
nnoremap <t> :tagbartoggle<cr>

" git yore fingers off them arrows
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" better hunk nav mapping
nmap ) <plug>gitgutternexthunk
nmap ( <plug>gitgutterprevhunk

" specify next uppercase
"onoremap M :<c-u>execute "normal! /[A-Z]\r:nohlsearch\r"<cr>

" vim annoyances
" stop cursor jumping when joining lines
"nnoremap J mzj`zdmz
omap iw <Plug>CamelCaseMotion_iw
xmap iw <Plug>CamelCaseMotion_iw
omap ib <Plug>CamelCaseMotion_ib
xmap ib <Plug>CamelCaseMotion_ib
omap ie <Plug>CamelCaseMotion_ie
xmap ie <Plug>CamelCaseMotion_ie

set scrolloff=15
set autochdir

nnoremap Y y$

command! Untrail %s/\s*$//
set virtualedit=block

function! StripUnderscores()
  let l:winview = winsaveview()
  let var = expand('<cword>')
  let newArg = substitute(var, "_", "", "")
  execute 'silent! %s/' . newArg . '_/' . newArg . '/g'
  wincmd l
  execute 'silent! %s/' . newArg . '_/' . newArg . '/g'
  call winrestview(l:winview)
  wincmd h
endfunction

function! SwapUnderscores()
  let l:winview = winsaveview()
  let var = expand('<cword>')
  execute 'silent! %s/' . var . '_/' . var . '£/g'
  execute 'silent! %s/' . var . '/' . var . '_/g'
  execute 'silent! %s/' . var . '_£/' . var . '/g'
  wincmd l
  execute 'silent! %s/' . var . '_/' . var . '£/g'
  execute 'silent! %s/' . var . '/' . var . '_/g'
  execute 'silent! %s/' . var . '_£/' . var . '/g'
  wincmd h
  call winrestview(l:winview)
endfunction

nnoremap <silent> <F1> :call SwapUnderscores()<CR>
nnoremap <silent> <F2> :call StripUnderscores()<CR>

"set clipboard=unnamed,unnamedplus

let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
