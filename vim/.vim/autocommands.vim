" Removes trailing whitespace, but perserves cursor position
function! RemoveTrailingWhitespace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

if has("autocmd")
  " Remove trailing whitespace on save
  au BufWrite *.js :call RemoveTrailingWhitespace()

  " Return to last edit position when opening files
  au BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif

  " Avoid showing trailing whitespace when in insert mode
  au InsertEnter * :set listchars-=trail:⋅
  au InsertLeave * :set listchars+=trail:⋅

  " Treat .js.es6 files as JavaScript
  au BufNewFile,BufRead *.js.es6 setf javascript
endif
