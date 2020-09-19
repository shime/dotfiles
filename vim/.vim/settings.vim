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
colorscheme palenight

" True colors for palenight color scheme
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Italics for palenight
let g:palenight_terminal_italics=1

" Set to auto read when a file is changed from the outside
set autoread

" Stop redrawing while executing macros (perfomance)
set lazyredraw

set ttyfast

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

" Ctags
" =====

" Look up ctags recursively from current dir to home
set tags=tags,./tags,./.git/tags;$HOME

" Neovim
" ======

" Neovim Python3 settings
let g:python3_host_prog="/usr/local/bin/python3"

" Plugins
" =======

" ALE
" ===

let g:ale_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'css': ['stylelint'],
\   'slim': ['slimlint'],
\ }
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'css':  ['stylelint', 'prettier'],
\   'scss': ['stylelint'],
\   'erb' : ['erb', 'tidy']
\ }
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 0

" Since ALE displays errors in sign column,
" display it all the time
set scl=yes


" FZF
" ===

" Enable fzf
set rtp+=/usr/local/opt/fzf

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Disable tab in FZF
let $FZF_DEFAULT_OPTS = '--bind tab:,shift-tab:'

" vim-test
" ========

" Use vimux for vim test
let test#strategy = "vimux"

" Startify
" ========
" Stop displaying Startify's cowsay header.
let g:startify_custom_header = ''
" Don't change to file's directory when navigating to files.
let g:startify_change_to_dir=0

" Airline
" =======

" " Airline configuration
let g:airline_theme='palenight'
let g:airline_detect_whitespace=0
let g:airline#extensions#ale#enabled = 0
let g:airline_extensions = []
let g:airline_section_a="%f%m"
let g:airline_section_b="%y"
let g:airline_section_x=""
let g:airline_section_y=""
let g:airline_section_z="%c %l/%L[%p%%]"
let g:airline_highlighting_cache = 1

" Tmuxline
" ========

" Tmuxline configuration
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

" AG
" ==

" Don't use regex search
let g:ackprg = 'ag --nogroup --nocolor --column --literal'

" vim-markdown
" ============

" Prevent vim-markdown from folding stuff
let g:vim_markdown_folding_disabled=1
