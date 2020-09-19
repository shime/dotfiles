" Removes trailing whitespace, but perserves cursor position
function! RemoveTrailingWhitespace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

" Add frozen string literal to the header of Ruby files.
function! RubyTemplate()
    " Add pragma comment
    call setline(1, '# frozen_string_literal: true')
    " Add two empty lines
    call append(1, repeat([''], 2))
    " Place cursor on line number 3
    call cursor(3, 0)
    " Write file to refresh the buffer
    execute "w"
endfunction

if has("autocmd")
  augroup sh_vimrc
    " Remove ALL autocommands of the current group.
    autocmd!
    " Add sparkup to new filetypes
    autocmd FileType javascript runtime! ftplugin/html/sparkup.vim
    " Remove trailing whitespace on save
    au BufWrite *.{js,rb} :call RemoveTrailingWhitespace()

    " Return to last edit position when opening files, but not for commit messages.
    au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g`\"" | endif

    " Avoid showing trailing whitespace when in insert mode
    au InsertEnter * :set listchars-=trail:⋅
    au InsertLeave * :set listchars+=trail:⋅

    " Treat .js.es6 files as JavaScript
    au BufNewFile,BufRead *.js.es6 setf javascript
     " Treat JSON files as JavaScript
    au BufNewFile,BufRead *.json setf javascript

    " mark Jekyll YAML frontmatter as comment
    au BufNewFile,BufRead *.{md,markdown,html,xml} sy match Comment /\%^---\_.\{-}---$/

    " Some file types use real tabs
    au FileType {make,gitconfig,go} setl noexpandtab

    " Reload file when it changes on disk
    au FocusGained * checktime

    " Add pragma comment to the header of Ruby files
    autocmd BufNewFile *.rb :call RubyTemplate()

    " Fix the SLOOOW syntax highlighting
    " au FileType ruby setlocal re=2 foldmethod=manual
  augroup END
endif
