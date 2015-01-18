function! ToggleTestMode()
  if g:rust_command_flag == '--test'
    echo 'testing disabled'
    let g:rust_command_flag = ''
  else
    echo 'testing enabled'
    let g:rust_command_flag = '--test'
  endif
endfunction

" <leader>t toggles test mode
nnoremap <leader>t :call ToggleTestModeRust()<cr>
let g:rust_command_flag = ''

" F5 runs current file
map <F5> :exec "!rustc ".g:rust_command_flag." % && ./%:r"<CR>
