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
noremap <Leader>a :Ag <cword><cr>

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

" Open files in directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>e :edit %%
map <Leader>s :split %%
map <Leader>v :vnew %%
map tn :tabedit %%

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

nnoremap <leader>y "+y
vnoremap <leader>y "+y

nnoremap <leader>p "+p
vnoremap <leader>p "+p

nnoremap <leader>d "+d
vnoremap <leader>d "+d

let g:airline_theme='jellybeans'
let g:airline_detect_whitespace=0

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

" Add little right margin
hi! link FoldColumn Normal
set foldcolumn=1

let g:slime_target="tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:niji_matching_filetypes = ['javascript', 'js']

" Status line stuff

set statusline=%<%1*\ %f\ %*       " filename
set statusline+=%2*%m%r%*          " modified, readonly
set statusline+=\ %3*%y%*          " filetype
set statusline+=\ %4*%{fugitive#head()}%0*
set statusline+=%=                 " left-right separation point
set statusline+=\ %5*%l%*/%L[%p%%]%5* " current line/total lines

hi StatusLine term=inverse,bold cterm=NONE ctermbg=24 ctermfg=189
hi StatusLineNC term=inverse,bold cterm=NONE ctermbg=24 ctermfg=153
hi User1 term=inverse,bold cterm=NONE ctermbg=29 ctermfg=159
hi User2 term=inverse,bold cterm=NONE ctermbg=29 ctermfg=16
hi User3 term=inverse,bold cterm=NONE ctermbg=24
hi User4 term=inverse,bold cterm=NONE ctermbg=24 ctermfg=221
hi User5 term=inverse,bold cterm=NONE ctermbg=24 ctermfg=209

nnoremap gz :!zeal --query "<cword>"&<CR><CR>

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

let g:no_turbux_mappings = "true"

au FileType ruby call RubyMappings()
au FileType rust call RustMappings()

" F5 runs file
au FileType javascript map <F5> :!node %<CR>
au FileType ruby map <F5> :!ruby %<CR>
au FileType rust map <F5> :exec "!rustc ".g:rust_command_flag." % && ./%:r"<CR>
au FileType python map <F5> :!python %<CR>

" F2 toggles spelling
map <F2> :setlocal spell! spelllang=en_us<CR>

" prevent vim-markdown from folding stuff
let g:vim_markdown_folding_disabled=1

nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:\zs<CR>
vmap <Leader>: :Tabularize /:\zs<CR>

map gm :call LivedownPreview()<CR>

function! <SID>RemoveTrailingWhitespace()
  " remove trailing whitespace, but perserve cursor position
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunction

" remove trailing whitespace upon saving
autocmd BufWritePre * :call <SID>RemoveTrailingWhitespace()

" list chars
set list                          " show invisible chars
set listchars=""                  " reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " the character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " the character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen
