" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }

" general
NeoBundle 'Shougo/neocomplete.vim' " requires vim compiled with if-lua option
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'scrooloose/syntastic'

" appearance
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'w0ng/vim-hybrid'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" misc
set number
syntax on

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

set backspace=indent,eol,start
set backup writebackup backupcopy=yes backupext=.bak backupdir=~/.vim/backup
if !isdirectory(&backupdir)
  call mkdir(&backupdir, 'p')
endif
set swapfile
set directory=.

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 2
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif

" lightline
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
  \ 'colorscheme' : 'wombat',
  \ }

" colorscheme
colorscheme hybrid
set background=dark
highlight Normal ctermbg=none

" autocmds

" https://docwhat.org/vim-preserve-your-cursor-and-window-state/
function! Preserve(command)
  let last_search=@/
  let save_cursor = getpos('.')
  normal H
  let save_window = getpos('.')
  call setpos('.', save_cursor)

  execute a:command

  let @/=last_search
  call setpos('.', save_window)
  normal zt
  call setpos('.', save_cursor)
endfunction

" delete trailing whitespace and blank line
" http://stackoverflow.com/a/356130
" http://stackoverflow.com/a/7496112
autocmd BufWritePre * :call Preserve('%s/\(\s\+$\)\|\(\(\n\|\s\)\+\%$\)//e')
