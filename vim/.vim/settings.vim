" General
" =======
" Remember more stuff in history
set history=1000

" Choose no compatiblity with legacy vi
set nocompatible

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in git anyway
set nobackup
set nowb
set noswapfile

" Enable filetype plugins
filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax on
syntax enable

" Set color scheme
set t_Co=256
set background=dark
colorscheme hs256

" Set to auto read when a file is changed from the outside
set autoread

" Stop redrawing while executing macros (perfomance)
set lazyredraw

" Stop clearing screen on exit
set t_ti= t_te=

" With a map leader it's possible to do extra key combinations
let mapleader = ","

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignored files and directories
set wildignore=*.o,*~,*.pyc
set wildignore+=.o,*.obj,.git,tmp,tags
set wildignore+=*.min.js,*.log,*.gif,*.jpg
set wildignore+=*/tmp/*,*/node_modules/*,*/.DS_Store

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Remember info about open buffers on close
set viminfo^=%

" Set left margin
hi! link FoldColumn Normal
set foldcolumn=1

" Delete comment char when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" Search
" ======
"
" When searching try to be smart about cases
set smartcase

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Indentation
" ===========
"
" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent
set ai
" Wrap lines
set wrap
" Be smart with indentation
set smartindent

" Status line
" ===========
" Show current cursor position
set ruler

" Always show the status line
set laststatus=2

" Status line format
set statusline=%<%1*\ %f\ %*               " filename
set statusline+=%2*%m%r%*                  " modified, readonly
set statusline+=\ %3*%y%*                  " filetype
set statusline+=\ %4*%{fugitive#head()}%0* " git branch
set statusline+=%=                         " left-right separation point
set statusline+=\ %5*%l%*/%L[%p%%]%5*      " current line/total lines

" Whitespace
" ===========
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set tabstop=2 shiftwidth=2

" Show invisible chars
set list

" Reset the listchars
set listchars=""

" Display leading tabs as "▸ ", trailing spaces as "⋅"
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮

" Command line
" ============
"
" Turn on the WiLd menu (used for command line completion)
set wildmenu
set wildmode=longest,list

" Expand folds when opening new buffer
set nofoldenable

" Make git diff splits vertical (used when resolving conflicts)
set diffopt+=vertical
