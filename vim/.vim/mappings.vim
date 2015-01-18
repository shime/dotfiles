" General
" =======
"
" Remap VIM 0 to first non-blank character
map 0 ^

" Exiting with ctrl+q
map <C-Q> :qa!<CR>
imap <C-Q> <Esc>:qa!<CR>

" Saving with ctrl+s
map <C-S> :w<CR>
imap <C-S> <Esc>:w<CR>

" Reload with ctrl+e
map <C-e> :e!<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map escape to ctrl + c
imap <C-c> <Esc>

" Edit ~/.vimrc with ,v
nmap <leader>V :tabedit $MYVIMRC<CR>

" Source current buffer with <leader>S
map <leader>S :so %<CR>

" Search for word under cursor with ag
noremap <Leader>a :Ag <cword><cr>

" Search visual selection with ag
vnoremap <Leader>a y:Ack <C-r>=fnameescape(@")<CR><CR>

" Open quickfix at the bottom of the screen
map <leader>cc :botright cope<cr>

" Copying and pasting
" ===================
"
" Copy into + register with <leader>y
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Paste from + register with <leader>p
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Delete into + register with <leader>p
nnoremap <leader>d "+d
vnoremap <leader>d "+d

" File management
" ===============
"
" Opens file in the current directory
map <leader>e :edit %%
" Opens a horizontal split in the current directory
map <Leader>s :split %%
" Opens a vertical split in the current directory
map <Leader>v :vnew %%
" Opens a new tab in the current directory
map <leader>te :tabedit %%

" Open files in directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Search
" ======
"
" Map <Space> to search and <leader><Space> to backwards search
map <space> /
map <leader><space> ?

" Clear the search buffer when hitting return
nnoremap ,<cr> :nohlsearch<cr>

" Buffer management
" =================
"
" Close the current buffer
map <leader>bd :Bclose<cr>

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Tab management
" ==============
"
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Visual selection
" ================
"
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" Spelling
" ========
"
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Add word under cursor to dictionary
map <leader>sa zg
" List spelling suggestions
map <leader>s? z=
