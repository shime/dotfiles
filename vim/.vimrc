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
" Import settings and mappings
source ~/.vim/settings.vim
source ~/.vim/mappings.vim
source ~/.vim/autocommands.vim

" Load plugin specific configurations from ~/.vim/local
source ~/.vim/local/turbux.vim

" Enable Pathogen
execute pathogen#infect()
call pathogen#helptags()

" Set CTRL-P to ignore anything matching this regex
let g:ctrlp_custom_ignore = 'DS_Store\|tmp\|node_modules'
" Set CTRL-P to lookup files based on regex, instead of basename only
let g:ctrlp_regexp = 1
" Set CTRL-P working directory to the first ancestor directory that contains .git/
let g:ctrlp_working_path_mode = 2

" Airline configuration
let g:airline_theme='jellybeans'
let g:airline_detect_whitespace=0

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

" Tabularize mappings
if exists(":Tabularize")
  nmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>= :Tabularize /=<CR>
  nmap <Leader>: :Tabularize /:\zs<CR>
  vmap <Leader>: :Tabularize /:\zs<CR>
endif

" Press gm to preview markdown file
if exists("*LivedownPreview")
  map gm :call LivedownPreview()<CR>
endif

" Eunuch mappings
map <leader>m :Move
cnoreabbrev W SudoWrite
cnoreabbrev rm Remove
cnoreabbrev mkdir Mkdir
cnoreabbrev chmod Chmod
