" Removes trailing whitespace, but perserves cursor position
function! RemoveTrailingWhitespace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

" Remove trailing whitespace on save
autocmd BufWrite *.js :call RemoveTrailingWhitespace()

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Avoid showing trailing whitespace when in insert mode
au InsertEnter * :set listchars-=trail:⋅
au InsertLeave * :set listchars+=trail:⋅

" Treat .js.es6 files as JavaScript
au BufNewFile,BufRead *.js.es6 setf javascript

" Make sure first line of git commit message is less than 70 chars
au FileType gitcommit set tw=70
