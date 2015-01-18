"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is the main vimrc file, keep only plugin-related
" configurations here. If plugin configuration consists of
" more than a couple of lines, move it into separate file.
"
" Organization:
"    * ~/.vim/settings.vim            - settings
"    * ~/.vim/mappings.vim            - mappings
"    * ~/.vim/local/<plugin_name>.vim - settings and mappings for
"                                       specific plugin
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Import settings and mappings
source ~/.vim/settings.vim
source ~/.vim/mappings.vim

" Load plugin specific configurations from ~/.vim/local
source ~/.vim/local/turbux.vim

" Enable Pathogen
execute pathogen#infect()
call pathogen#helptags()

" Set CTRL-P to ignore anything matching this regex
let g:ctrlp_custom_ignore = 'app\/assets\/javascripts\/node_modules\|DS_Store\|\.git\|tmp\|node_modules'
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

function! RubyMappings()
  map <leader>t <Plug>SendTestToTmux
  map <leader>T <Plug>SendFocusedTestToTmux
endfunction

function! RustMappings()
  nnoremap <leader>t :call ToggleTestModeRust()<cr>
  let g:rust_command_flag = ''
endfunction

function! ToggleTestModeRust()
  if g:rust_command_flag == '--test'
    echo 'testing disabled'
    let g:rust_command_flag = ''
  else
    echo 'testing enabled'
    let g:rust_command_flag = '--test'
  endif
endfunction

au FileType ruby call RubyMappings()
au FileType rust call RustMappings()

" F5 runs file
au FileType javascript map <F5> :!node %<CR>
au FileType ruby map <F5> :!ruby %<CR>
au FileType rust map <F5> :exec "!rustc ".g:rust_command_flag." % && ./%:r"<CR>
au FileType python map <F5> :!python %<CR>

" prevent vim-markdown from folding stuff
let g:vim_markdown_folding_disabled=1

" Tabularize mappings
nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:\zs<CR>
vmap <Leader>: :Tabularize /:\zs<CR>

" Press gm to preview markdown file
map gm :call LivedownPreview()<CR>

" Removes trailing whitespace, but perserves cursor position
function! RemoveTrailingWhitespace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

" Call trailing whitespace removal when saving
autocmd BufWrite * :call RemoveTrailingWhitespace()
