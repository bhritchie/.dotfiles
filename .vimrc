execute pathogen#infect()
call pathogen#helptags()

" SETTINGS
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

" CUSTOM MAPPINGS
inoremap kj <esc>
inoremap <esc> <nop>
let mapleader=" "
nnoremap <leader>w :write<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>' <esc>`<i'<esc>`>i'<esc>
vnoremap <leader>" <esc>`<i"<esc>`>i"<esc>
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader>/ :nohlsearch<cr>
nnoremap H ^
nnoremap L g_

set backspace=indent,eol,start
set hlsearch incsearch
set clipboard=unnamed

" autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

syntax enable
set number
set background=dark
" let g:solarized_termcolors = 256
colorscheme solarized
filetype plugin indent on
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set smarttab
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*
set wildmenu
set hidden

" PLUGINS

" https://github.com/tpope/vim-commentary
nmap <buffer> <leader>c gcc
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

" https://github.com/edkolev/tmuxline.vim
let g:tmuxline_preset = {
  \ 'a': '#S',
  \ 'b': [' #(git rev-parse --symbolic-full-name --abbrev-ref HEAD)'],
  \ 'win': ['#I', '#W'],
  \ 'cwin': ['#I', '#W #F'],
  \ 'y': ['%l:%M%p'],
  \ 'z': ['%A, %B %d']}
