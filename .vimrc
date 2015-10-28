" WISHLIST
" Real autoloading of file
" au FocusGained,BufEnter * :silent! !

" LOAD PLUGINS {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin 'AndrewRadev/vim-eco' "\"Eco (embedded coffee-script) support for Vim\"
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ap/vim-buftabline'
" Plugin 'bling/vim-airline'
" Plugin 'file:///Users/Brendan/dev/no-comment'
" Plugin 'edkolev/tmuxline.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'jgdavey/tslime.vim' "\"This is a simple vim script to send portion of text from a vim buffer to a running tmux session.\"
Plugin 'janko-m/vim-test' "\"A Vim wrapper for running tests on different granularities.\"
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
" Plugin 'lambdatoast/elm.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-commentary'
call vundle#end()
filetype plugin indent on
" }}}

" SETTINGS {{{
set nobackup
set nowritebackup
set noswapfile
set number
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
set background=dark
" let g:solarized_termcolors = 256
colorscheme solarized
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set smarttab
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*
set wildmenu
set wildmode=list:longest,list:full
set hidden
set ignorecase smartcase
set spelllang=en_ca
" set clipboard=unnamed
" }}}

" MAPPINGS {{{
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
" nnoremap <leader><leader> <c-^>
" nnoremap <leader>c :NoComment<cr>
nnoremap <leader>c gcc
nnoremap H ^
nnoremap L g_
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" SOME INTERESTING POSSIBILITIES
" nnoremap gV `[v`] " highlight last inserted text
" nnoremap <leader>s :mksession<CR> " save session (have to remap, I already use s
" }}}

" COMMANDS {{{
command! BD 1,9999bd
"}}}
"
"AUTOCOMMANDS {{{
augroup vimrc
  autocmd!
  autocmd FileType Bufread,BufNewFile *.md filetype=markdown
  autocmd FileType markdown setlocal spell wrap
  autocmd FileType gitcommit setlocal spell
  autocmd FileType css,scss,sass setlocal iskeyword+=
  " autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
  autocmd Filetype vim setlocal foldmethod=marker
  autocmd FileType javascript setlocal foldmethod=syntax
  autocmd FileType javascript setlocal foldlevel=99
  autocmd FileType javascript syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
augroup END

augroup javascript
  autocmd!
  "autocmd FileType javascript setlocal ...
  " autocmd FileType javascript setlocal syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
  autocmd FileType javascript setlocal foldmethod=syntax
  " autocmd FileType javascript setlocal syntax=javaScript
augroup END
" }}}

" ABBREVIATIONS {{{
iabbrev lipsum Lorem ipsum dolor sit amet, consectetur adipiscing elit,<cr>sed do eiusmod tempor incididunt ut labore et dolore<cr>magna aliqua. Ut enim ad minim veniam, quis nostrud<cr>exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.<cr>Duis aute irure dolor in reprehenderit in voluptate velit esse<cr>cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat<cr>cupidatat non proident, sunt in culpa qui officia deserunt<cr>mollit anim id est laborum.
" }}}

" FUNCTIONS {{{
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
" }}}

" STATUS LINE {{{
set statusline=\ %F\ %y "filename and filetype
set statusline+=%= "swith to right side
set statusline+=\ %l/%L\ "current line/total lines


" }}}

" PLUGINS SETTINGS {{{

" https://github.com/airblade/vim-gitgutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=darkgreen
highlight GitGutterChange ctermfg=darkyellow
highlight GitGutterDelete ctermfg=darkred
highlight GitGutterChangeDelete ctermfg=darkyellow

" https://github.com/bling/vim-airline
" let g:airline_powerline_fonts = 1
" let g:airline_section_b="%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}"
" let g:airline_theme="solarized"
" set noshowmode
set laststatus=2
set timeoutlen=500 ttimeoutlen=0
" let g:airline_powerline_fonts = 1
" Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
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
" let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" https://github.com/janko-m/vim-test
let test#strategy = "tslime"
let test#javascript#mocha#executable = 'mocha'
let test#javascript#mocha#options = '--recursive --compilers js:babel-core/register --require test/setup.js'
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR> "doesn't work - get an only one instance of babel/polyfill allowed error
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" https://github.com/rking/ag.vim
nnoremap \ :Ag<SPACE>

" https://github.com/scrooloose/syntastic
let g:syntastic_check_on_wq = 0
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_check_on_opening=0
let g:syntastic_javascript_checkers = ['eslint']
" Example usage
" :SyntasticInfo
" let g:syntastic_c_checkers=['make','splint']
"confirmationMessage let g:syntastic_ignore_files = ['\m^/usr/include/', '\m\c\.h$']

" https://github.com/kien/ctrlp.vim
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0 " only usable with Ag - see note on conflict with dotfiles below
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_switch_buffer = 'Et'
" let g:ctrlp_show_hidden = 1 " doesn't work with ctrlp_user_command
" let g:ctrlp_switch_buffer = 0 " open files in new buffer

" https://github.com/edkolev/tmuxline.vim
" let g:tmuxline_preset = {
  " \ 'a': '#S',
  " \ 'b': [' #(git rev-parse --symbolic-full-name --abbrev-ref HEAD)'],
  " \ 'win': ['#I', '#W'],
  " \ 'cwin': ['#I', '#W #F'],
  " \ 'y': ['%l:%M%p'],
  " \ 'z': ['%A, %B %d']}

" https://github.com/ludovicchabant/vim-gutentags
let g:gutentags_cache_dir = expand("~/.tags")

"No Comment comment strings
let g:no_comment_strings = {
  \ "vim": '"',
  \ "ruby": '#',
  \ "coffee": '#',
  \ "html": {"open":'<!--', "close":'-->'},
  \ "eruby": {"open":'<!--', "close":'-->'},
  \ "scss": '//'
  \ }
" }}}
