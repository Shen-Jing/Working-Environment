set nocompatible              " be iMproved, required
filetype off                  " required
runtime macros/matchit.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'w0rp/ale'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-obsession'
Plugin 'Valloric/YouCompleteMe'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ---My individual config---
colorscheme Tomorrow-Night
syntax on
set fileencodings=utf-8,utf-16,big5,gb2312,gbk,gb18030,euc-jp,euc-kr,latin1
set encoding=utf-8

" -UI config-
set t_Co=256
set number
set showcmd
set mouse=a " all mode can use mouse
set cursorline
" hi CursorLine cterm=none ctermbg=LightGray ctermfg=White
set cursorcolumn
" hi CursorColumn cterm=none ctermbg=LightGray ctermfg=White
set wildmenu " visual autocomplete for command menu
set ignorecase " ignore case while searching
set incsearch " search as characters are entered
set hlsearch

" -editing, indent-
set cindent " based on autoindent -> smartindent -> add programming syntax check
set expandtab
set shiftwidth=4
set tabstop=2
set softtabstop=2 " virtual tab, it's also the keyboard tab key
set backspace=indent,eol,start  " more powerful backspacing

" -keymap-
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" ---NERDTree config---
" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"map F2 to open NERDTree
map <F2> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---Tagbar config---
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left = 1
nmap <F3> :TagbarToggle<CR>

" ---easymotion config---
" ---ale (syntax checker(asychronous))---
let g:ale_sign_column_always = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" ---YouCompleteMe setting---
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" ---airline config---
" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" ---tabeline config (airline)---
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
