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

" Import settings and mappings
source ~/.vim/settings.vim
source ~/.vim/mappings.vim
source ~/.vim/autocommands.vim

" Load plugin specific configurations from ~/.vim/local
source ~/.vim/local/turbux.vim

" Set CTRL-P to ignore anything matching this regex
let g:ctrlp_custom_ignore = 'DS_Store\|tmp\|node_modules'

" Set CTRL-P to lookup files based on regex, instead of basename only
let g:ctrlp_regexp = 1

" Set CTRL-P working directory to the first ancestor directory that contains .git/
let g:ctrlp_working_path_mode = 2

" let g:ctrlp_cmd = 'CtrlPMRU'

" Airline configuration
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
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

" Show git diff for current file
map <leader>d :!git diff %<CR>

map <C-a> :Ag

let g:jsx_ext_required = 0

augroup sparkup_types
  " Remove ALL autocommands of the current group.
  autocmd!
  " Add sparkup to new filetypes
  autocmd FileType javascript runtime! ftplugin/html/sparkup.vim
augroup END

let $BASH_ENV = "~/.aliases"
