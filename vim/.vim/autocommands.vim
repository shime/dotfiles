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

  " Make sure first line of git commit message is less than 70 chars
  au FileType gitcommit set tw=70

  " Source the vimrc file after saving it
  " http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
  au bufwritepost .vimrc source $MYVIMRC
  au bufwritepost ~/.vim/settings.vim source $MYVIMRC
  au bufwritepost ~/.vim/mappings.vim source $MYVIMRC
  au bufwritepost ~/.vim/autocommands.vim source $MYVIMRC
endif
