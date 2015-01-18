" Don't use default Turbux mappings
let g:no_turbux_mappings = "true"

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

" Turbux uses 'cucumber -rfeatures' by default, override it
let g:turbux_command_cucumber = 'cucumber -r features'

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

