""""""""""""""| Vim Configure File |""""""""""""""""
"
" Author:                 firejq<firejq@firejq.com>
" Create Date:            2018.10.28
" Update Date:
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"             for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"           for OpenVMS:  sys$login:.vimrc


let mapleader = ","                                 |" Key Maps
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""" Plugin Settings Begin
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                       |" let Vundle manage Vundle, required

"""plugin YouCompleteMe Begin
Plugin 'Valloric/YouCompleteMe'
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>ys :YcmShowDetailedDiagnostic<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
"""plugin YouCompleteMe End

"""plugin:NERDTree Begin
Plugin 'scrooloose/nerdtree'
let g:NERDTreeWinSize=30
nmap <leader><C-e> :NERDTreeToggle<CR>
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\~$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let NERDTreeShowHidden=1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
"""plugin:NERDTree End

"""plugin:ctrlp Begin
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_open_new_file = 'r'                     |" create new file in new tab with <c-y>
let g:ctrlp_open_multiple_files = 'rt'              |" open multiple files marked with <c-o> and using <c-z> in new tab
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
"""plugin:ctrlp End

call vundle#end()            " required
filetype plugin indent on    " required
filetype on

"""""""""""""""""""""""""""""""""""""""""""""""""""""" Plugin Settings End



""""""""""""""""""""""""""""""""""""""""""""""""""""" Base Vim Settings Begin
"autocmd BufWritePost .vimrc source %                |" auto reload the .vimrc after modifying it

" Tab Settings
set expandtab                                       |" use spaces instead of tab
set smarttab                                        |"
set tabstop=4                                       |" 4 spaces that a tab in the file counts for
set softtabstop=4                                   |" 4 spaces that a tab counts for while performing editing operations
set shiftwidth=4                                    |" 4 spaces to use for each step of (auto)indent. Used for |'cindent'|, |>>|, |<<|, etc
autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js,*.py,*.vim,.vimrc,*.md setlocal
  \ tabstop=2
  \ softtabstop=2
  \ shiftwidth=2                                    |" use 2 spaces that a tab counts for some file types
autocmd FileType text setlocal textwidth=78         |" For all text files set 'textwidth' to 78 characters
autocmd FileType python setlocal textwidth=79

set number                                          |" show line number
set ruler
"set mouse=a
"set syntax=on
set showmatch
set autoread                                        |" When a file has been detected to have been changed outside of Vim, automatically read it again
set nocompatible                                    |" donot be compatible with vi
set scrolloff=10                                    |" Minimal number of screen lines to keep above and below the cursor
set backspace=indent,eol,start                      |" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode

" Search Settings
set hlsearch                                        |" When there is a previous search pattern, highlight all its matches
set incsearch                                       |" While typing a search command, show where the pattern, as it was typed so far, matches
set ignorecase

" Indention Settings
"set autoindent                                      |" copy indent from current line when starting a new line
"set cindent                                         |" enables automatic C program indenting
"set smartindent                                     |" do smart autoindenting when starting a new line
autocmd BufNewFile,BufRead *.c,*.cpp,*.h setlocal cindent

set noerrorbells                                    |" no error bells

"complete mode after entering : in command mode
set wildmode=list:longest
set completeopt=longest,menu

" do not make temp/swap file
set nobackup
set noswapfile

" File Encoding Settings
set encoding=utf-8                                  |" the character encoding used inside Vim
set fileencodings=utf-8                             |" a list of character encodings considered when starting to edit an existing file
set fileencodings+=,ucs-bom
set fileencodings+=,shift-jis
set fileencodings+=,gb2312
set fileencodings+=,gbk
set fileencodings+=,gb18030
set fileencodings+=,cp936

" Highlight Settings
set cursorline                                      |" highlight the current row
set cursorcolumn                                    |" highlight the current column
"set colorcolumn=80                                  |" highlight the 80 column
"hightlight ColorColumn term=bold cterm=bold ctermbg=grey guibg=grey

" Code color style Settings
colorscheme desert
set background=dark                                 |" Tell vim what background you are using [dark|light]

" Statusline Settings
set laststatus=2                                    |" always display the statusline
set statusline=[%F%m%r%h%w]                         |" display the file path
set statusline+=\                                   |" space separated
set statusline+=[FORMAT=%{&ff}]                     |" display the file format
set statusline+=\                                   |" space separated
set statusline+=[TYPE=%Y]                           |" display the file type
set statusline+=\                                   |" space separated
set statusline+=[POS=%l,%v](%p%%)                   |" display the current postion
set statusline+=\                                   |" space separated
set statusline+=%{strftime(\"%y/%m/%d\ %H:%M\")}    |" display current time

"if &t_Co > 2 || has("gui_running")
if has("gui_running")
  set lines=35 columns=140                          |" window size
  set splitbelow splitright                         |" set the position of the spilt windows
  set guioptions-=T                                 |" hide the menu/tool bar
    \ guioptions-=m
    \ guioptions-=L
    \ guioptions-=r
    \ guioptions-=b
  set guifont=Consolas:h12:cANSI                    |" set the font, 'Inconsolata:h12:cANSI'
endif

set showcmd                                         |" show commands you type

" use Ctrl + hjkl to move cursor in the Insert Mode
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <left>
"inoremap <C-l> <Right>

" insert matched brackets automatically
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap { {}<LEFT>
"inoremap < <><LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>

" keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Compile and Run code
" C lang
function! CompileRunGcc()
  w
  !gcc % -o %<
  ! ./%<
endfunction
" Cpp lang
function! CompileRunGpp()
  w
  !g++ % -o %<
  ! ./%<
endfunction
" Main Function
function! CompileRun()
  if (@% =~? '[*]*\.c$]')
      call CompileRunGcc()
  elseif (@% =~? '[*]*\.cpp$')
      call CompileRunGpp()
  else
      echo 'Unsupport file type!'
  endif
endfunction
map <F5> :call CompileRun()<CR>


function! PasteToggle()
  if (&paste)
    set nopaste
  else
    set paste
  endif
endfunction
map <silent><leader>p :call PasteToggle()<CR>

function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()

"""""""""""""""""""""""""""""""""""""""""""""""""""""" Base Vim Settings End
