set nocompatible              " be iMproved, required
runtime macros/matchit.vim

" ***** vim-plug *****
" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" sort by alphabet
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
" Instead of separately installing fzf on your system (using Homebrew or `git clone')
"  and enabling it on Vim (adding it to &runtimepath),
"  you can use vim-plug to do both.
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
" Load on nothing
Plug 'Valloric/YouCompleteMe', { 'on': [] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

" load ultisnips and YouCompleteMe first time you enter insert mode
augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
                     \| autocmd! load_us_ycm
augroup END

" Initialize plugin system
" Update `&runtimepath` and initialize plugin system
" Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" ***My individual config***
"colorscheme Tomorrow-Night
colorscheme gruvbox
syntax on
set fileencodings=utf-8,utf-16,big5
set encoding=utf-8

" *UI config*
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

" *editing, indent*
set cindent " based on autoindent -> smartindent -> add programming syntax check
set expandtab
set shiftwidth=4
set tabstop=2
set softtabstop=2 " virtual tab, it's also the keyboard tab key
set backspace=indent,eol,start  " more powerful backspacing

" *keymap*
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>

" ***NERDTree config***
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map F2 to open NERDTree
map <F2> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ***vim-nerdtree-syntax-highlight***
" *Highlight folders using exact match*
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" *Customizing colors*
" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

" ***Tagbar config***
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left = 1
nmap <F3> :TagbarToggle<CR>

" ***easymotion config***
" The default leader has been changed to <Leader><Leader> 
"  to avoid conflicts with other plugins you may have installed.

" ***ale (syntax checker(asychronous))***
let g:ale_sign_column_always = 1 " keep the sign gutter open at all times
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'csh': ['shell'],
\   'zsh': ['shell'],
\   'go': ['gofmt', 'golint'],
\   'c': ['clang', 'cppcheck'],
\   'cpp': ['clang', 'cppcheck'],
\   'python': ['pylint', 'mypy'],
\   'text': [],
\}
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
" %s: error msg; %linter%: linter name; %severity: severity type
let g:ale_echo_msg_format = '[%linter%] %code: % %s [%severity%]'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++17'
let g:ale_cpp_clang_options = '-Wall -O2 -std=c++17'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_sign_error = '❌'
let g:ale_sign_warning = ''
" Cancel ugly pink background
highlight clear ALEErrorSign
highlight clear ALEWarningSign
" gui sets gvim and cterm sets vim
highlight ALEErrorSign ctermfg=9 guifg=#C30500 guibg=#F5F5F5
highlight ALEWarningSign ctermfg=11 guifg=#ED6237 guibg=#F5F5F5
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" ***YouCompleteMe setting***
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0 " turn off gutter signs, text highlighting
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
"let g:ycm_key_invoke_completion = '<c-z>'
"set completeopt=menu,menuone
 
"noremap <c-z> <NOP>
 
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

" ***airline config***
" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" ***tabeline config (airline)***
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1

" ***gruvbox***
set background=dark
