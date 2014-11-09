set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'AndrewRadev/vim-eco'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
call vundle#end()
filetype plugin indent on

" WISHLIST
" Real autoloading of file
" au FocusGained,BufEnter * :silent! !
" Fix whatever is wrong with my vim-commentary setup

" SETTINGS
set nobackup
set nowritebackup
set noswapfile
set numberwidth=1
set linebreak
set shiftround
set nowrap
set scrolloff=1
set sidescrolloff=5
set autoread
set fileformats+=mac
set autoindent
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list
set cursorline
set splitbelow
set splitright
set backspace=indent,eol,start
set hlsearch incsearch
syntax enable
set number
set background=dark
" let g:solarized_termcolors = 256
colorscheme solarized
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set smarttab
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*
set wildmenu
set wildmode=list:longest,list:full
set hidden
" set clipboard=unnamed

" MAPPINGS
let mapleader=" "
inoremap kj <esc>
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
" inoremap <esc> <nop>
nnoremap <leader>w :write<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>' <esc>`<i'<esc>`>i'<esc>
vnoremap <leader>" <esc>`<i"<esc>`>i"<esc>
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>v :source $MYVIMRC<cr>
nnoremap <silent> <leader>/ :nohlsearch<cr>
nnoremap <leader><leader> <c-^>
nnoremap H ^
nnoremap L g_

" COMMANDS
command! BD 1,9999bd

"AUTOCOMMANDS
augroup vimrc
  autocmd!
  autocmd FileType Bufread,BufNewFile *.md filetype=markdown
  autocmd FileType gitcommit setlocal spell
  autocmd FileType markdown setlocal spell
  autocmd FileType css,scss,sass setlocal iskeyword+=
  " autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
augroup END

" FUNCTIONS
" Tab invkes autocompletion except at start of line
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <silent> <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" PLUGINS

" https://github.com/tpope/vim-commentary
nmap <leader>c gcc
" Support additional filetypes
" autocmd FileType apache set commentstring=#\ %s
augroup commentgroup
  autocmd!
  autocmd FileType vim set commentstring="\ %s
augroup END

" https://github.com/airblade/vim-gitgutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=darkgreen
highlight GitGutterChange ctermfg=darkyellow
highlight GitGutterDelete ctermfg=darkred
highlight GitGutterChangeDelete ctermfg=darkyellow

" https://github.com/bling/vim-airline
let g:airline_powerline_fonts = 1
let g:airline_section_b="%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}"
let g:airline_theme="solarized"
set noshowmode
set laststatus=2
set timeoutlen=500 ttimeoutlen=0
" let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Maybe put this in a section
" set statusline+=%{autotags#statusline()}

set noerrorbells visualbell t_vb=
augroup bellgroup
  autocmd!
  autocmd GUIEnter * set visualbell t_vb=
augroup END

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" https://github.com/thoughtbot/vim-rspec
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" https://github.com/rking/ag.vim
nnoremap \ :Ag<SPACE>
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" https://github.com/scrooloose/syntastic
let g:syntastic_check_on_wq = 0
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_check_on_opening=0
" Example usage
" :SyntasticInfo
" let g:syntastic_c_checkers=['make','splint']
" let g:syntastic_ignore_files = ['\m^/usr/include/', '\m\c\.h$']

" https://github.com/kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_switch_buffer = 'Et'

" https://github.com/edkolev/tmuxline.vim
let g:tmuxline_preset = {
  \ 'a': '#S',
  \ 'b': [' #(git rev-parse --symbolic-full-name --abbrev-ref HEAD)'],
  \ 'win': ['#I', '#W'],
  \ 'cwin': ['#I', '#W #F'],
  \ 'y': ['%l:%M%p'],
  \ 'z': ['%A, %B %d']}

" https://github.com/ludovicchabant/vim-gutentags
let g:gutentags_cache_dir = expand("~/.tags")
