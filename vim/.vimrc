"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is the main vimrc file, keep only plugin-related
" configurations here. If plugin configuration consists of
" more than a couple of lines, move it into separate file.
"
" Organization:
"    * ~/.vim/settings.vim            - settings
"    * ~/.vim/mappings.vim            - mappings
"    * ~/.vim/autocommands.vim        - auto commands
"    * ~/.vim/local/<plugin_name>.vim - settings and mappings for
"                                       specific plugin
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable Pathogen
execute pathogen#infect()
call pathogen#helptags()

call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-repeat'
Plug 'edkolev/tmuxline.vim'
Plug 'pangloss/vim-javascript'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-unimpaired'
Plug 'othree/html5.vim'
Plug 'tristen/vim-sparkup'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'bogado/file-line'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'gmarik/vundle'
Plug 'shime/vim-livedown'
Plug 'rking/ag.vim'
Plug 'davidbeckingsale/writegood.vim'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-eunuch'
Plug 'shime/molokai'
Plug 'tpope/vim-pathogen'
Plug 'elzr/vim-json'
Plug 'https://github.com/mxw/vim-jsx.git'
Plug 'othree/yajs.vim'
Plug 'vim-scripts/ZoomWin'
Plug 'tpope/vim-rhubarb'
Plug 'jasonshell/vim-svg-indent'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'nicwest/vim-http'
Plug 'junegunn/fzf.vim'
Plug 'ngmy/vim-rubocop'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'
Plug 'tpope/vim-rails'
Plug 'bling/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'
Plug 'alok/notational-fzf-vim'

call plug#end()

" Import settings and mappings
source ~/.vim/settings.vim
source ~/.vim/mappings.vim
source ~/.vim/autocommands.vim

" Load plugin specific configurations from ~/.vim/local
source ~/.vim/local/turbux.vim

" " Airline configuration
let g:airline_theme='simple'
let g:airline_detect_whitespace=0
let g:airline_section_a="%f%m"
let g:airline_section_b="%y"
let g:airline_section_c="%{airline#util#wrap(airline#extensions#branch#get_head(),0)}"
let g:airline_section_x=""
let g:airline_section_y=""
let g:airline_section_z="%c %l/%L[%p%%]"

" Tmuxline configuration
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

" Prevent vim-markdown from folding stuff
let g:vim_markdown_folding_disabled=1

" Tell ag.vim to stop using regex search
let g:ackprg = 'ag --nogroup --nocolor --column --literal'

" Press gm to preview markdown file
map gm :LivedownPreview<CR>

" Eunuch mappings
map <leader>m :Move %%

" Used for project-wide search and replace with
"
" Qargs | argdo %s/findme/replacement/gc | update
"
" Hat tip to Drew Neil
" http://stackoverflow.com/a/5686810/726020
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

cabbrev ag Ag

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
" function! SetupCtrlP()
"   if exists("g:loaded_ctrlp") && g:loaded_ctrlp
"     augroup CtrlPExtension
"       autocmd!
"       autocmd FocusGained  * CtrlPClearCache
"       autocmd BufWritePost * CtrlPClearCache
"     augroup END
"   endif
" endfunction
" if has("autocmd")
"   autocmd VimEnter * :call SetupCtrlP()
" endif

" Show git diff for current file
map <leader>d :!git diff %<CR>

let g:jsx_ext_required = 0

augroup sparkup_types
  " Remove ALL autocommands of the current group.
  autocmd!
  " Add sparkup to new filetypes
  autocmd FileType javascript runtime! ftplugin/html/sparkup.vim
augroup END

let $BASH_ENV = "~/.aliases"

set autoread
au FocusGained * :checktime

" ALE settings
let g:ale_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'css': ['stylelint'],
\   'slim': ['slimlint'],
\ }
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'ruby': ['rubocop'],
\   'css':  ['stylelint', 'prettier'],
\   'scss': ['stylelint'],
\   'erb' : ['erb', 'tidy']
\ }
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 1

nmap <silent> <leader>nn :ALENext<cr>
nmap <silent> <leader>pp :ALEPrevious<cr>

set scl=yes

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

" Start FZF with CTRL-P
nmap <C-P> :FZF<CR>

" Look up ctags recursively from current dir to home
set tags=tags,./tags,./.git/tags;$HOME

" Recommended shortcuts from 'ins-completion' help file
inoremap <C-]> <C-X><C-]>
inoremap <C-F> <C-X><C-F>
inoremap <C-D> <C-X><C-D>
inoremap <C-L> <C-X><C-L>

" Mappings for vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Use vimux for vim test
let test#strategy = "vimux"

" Auto-reload the file if it changes on disk
set autoread                                                                                                                                                                                    
au CursorHold * checktime

if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_user_caching = 0
endif

nnoremap <leader>ni :e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>

command! -nargs=1 Ngrep vimgrep "<args>" $NOTES_DIR/**/*.md
nnoremap <leader>nn :Ngrep

" Vimwiki settings
let g:vimwiki_list = [{'path': '~/Documents/Notes/',
                      \ 'syntax': 'markdown', 'ext': '.wiki', 'diary_rel_path': '.'}]


" Notational FZF settings
let g:nv_search_paths = ['~/Documents/Notes']
let g:nv_default_extension = '.md'
