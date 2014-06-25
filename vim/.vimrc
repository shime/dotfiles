" Importing basic settings
source ~/.vim/basic_vimrc.vim

" Enable Pathogen
execute pathogen#infect()

" Enable syntax highlighting
syntax on
syntax enable 

" Try to set the color scheme if it's available
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme grb256

" Highlight current cursor position
" set cursorline
set cmdheight=1
set switchbuf=useopen
set showtabline=1
set winwidth=79

" Choose no compatiblity with legacy vi
set nocompatible                                    

" 1 tab == 2 spaces
set tabstop=2 shiftwidth=2                          

" Super fast Ack
map <Leader>a :Ack<CR>

" Toggle Zeus when running tests with Turbux
nnoremap <leader>z :call ToggleZeus()<cr>
function! ToggleZeus()
  if g:turbux_command_prefix == 'zeus'
    echo 'zeus disabled'
    let g:turbux_command_prefix = ''
  else
    echo 'zeus enabled'
    let g:turbux_command_prefix = 'zeus'
  endif
endfunction

" Toggle `bundle exec` when running tests with Turbux
nnoremap <leader>B :call ToggleBundler()<cr>
function! ToggleBundler()
  if g:turbux_command_prefix == 'bundle exec'
    echo 'bundle exec disabled'
    let g:turbux_command_prefix = ''
  else
    echo 'bundle exec enabled'
    let g:turbux_command_prefix = 'bundle exec'
  endif
endfunction

" Quickly run specific test
map <leader>rs :RSspec 

" Source file with <leader>s
map <leader>S :so %<CR>

" Editing ~/.vimrc with ,v
nmap <leader>V :tabedit $MYVIMRC<CR>

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>N :call RenameFile()<cr>

" Stop clearing screen when suspended
set t_ti= t_te=

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Open files in directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>e :edit %%
map <Leader>s :split %%
map <Leader>v :vnew %%

" Remember more commands and search history
set history=10000

" Turbux uses 'cucumber -rfeatures' by default, override it
let g:turbux_command_cucumber = 'cucumber -r features' 

" Add routes to rails.vim
command! Rroutes :RE config/routes.rb
command! RTroutes :RT config/routes.rb

" Add factories to rails.vim
command! Rfactories :RE spec/factories.rb
command! RTfactories :RT spec/factories.rb

" Map escape to ctrl + c
imap <C-c> <Esc>

let g:rails_projections = {
      \ "features/*.feature": {
      \ "command": "feature",
      \ "related": "step_definitions/%s_steps.rb"
      \},
      \ "features/step_definitions/*_steps.rb": {
      \ "command": "step",
      \ "related": "features/%s.feature"
      \}
      \}

let g:ctrlp_custom_ignore = 'app\/assets\/javascripts\/node_modules\|DS_Store\|\.git\|tmp\|node_modules'
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1

nnoremap Y "+y
vnoremap Y "+y
nnoremap YY "+yy
vnoremap YY "+yy

nnoremap PP "+p
vnoremap PP "+p

let g:airline_theme='jellybeans'
let g:airline_detect_whitespace=0

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

" Spelling stuff
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" Add little right margin
hi! link FoldColumn Normal
set foldcolumn=1

let g:slime_target="tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
