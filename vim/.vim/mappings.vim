" General
" =======
"
" Remap VIM 0 to first non-blank character
map 0 ^

" Exiting with ctrl+q
map <C-Q> :qa!<CR>
imap <C-Q> <Esc>:qa!<CR>

" Saving with ctrl+s
map <C-S> :wa<CR>
imap <C-S> <Esc>:wa<CR>

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

" Open quickfix at the bottom of the screen
map <leader>cc :botright cope<cr>

" Close quickfix
map <leader>qq :ccl<cr>

" Toggle between last open buffers
nnoremap <leader><leader> <c-^>

" Open repo/user URLS on github
nnoremap gX :OpenURL http://github.com/<cfile><CR>
function! OpenURL(url)
 exe "!xdg-open \"".a:url."\""
 redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)

" Open links with gx
function! LinkInterceptor()
  let line0=getline (".")
  let line=matchstr (line0, "http[^]\"\) ]*")

  if line==""
      let line=matchstr (line0, "ftp[^\"\) ]*")
  endif

  if line==""
      let line=matchstr (line0, "file[^\"\) ]*")
  endif

  let line= escape (line, "#?&;|%")
  exec ':silent !open ' . line
endfunction
nnoremap <silent> gx :call LinkInterceptor()<CR>

" Make C-a work in command line mode (to match C-e)
cnoremap <C-a> <Home>

" Navigate previous/next command with <C-j> and <C-k> in cmd line
cmap <C-k> <Up>
cmap <C-j> <Down>

" Copying and pasting
" ===================
"
" Copy into + register with <leader>y
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Paste from + register with <leader>p and fix indentation
nnoremap <leader>p "+pV`]=
vnoremap <leader>p "+PV`]=

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

map <leader>E :e!<CR>

" Open files in directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Search
" ======
"
" Map <Space> to search and <leader><Space> to backwards search
map <space> /
map <leader><space> ?

" Completions
" ===========
"
" Recommended shortcuts from 'ins-completion' help file
inoremap <C-]> <C-X><C-]>
inoremap <C-F> <C-X><C-F>
inoremap <C-D> <C-X><C-D>
inoremap <C-L> <C-X><C-L>

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

" <leader>r searches and replaces the selected text in current file
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" <leader>gr replaces word globaly inside the project
vnoremap <silent> <leader>gr :call VisualSelection('global_replace', '')<CR>

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
    elseif a:direction == 'global_replace'
        execute "Ag " . l:pattern
        call CmdLine("cdo %s/" . l:pattern . "//gc")
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str . " \| update"
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

" Git
" ========
"
" Add to index with ,ga
map <leader>ga :silent !git add % &<cr><cr>

" Show git diff for current file
map <leader>d :!git diff %<CR>

" Plugins
" =======

" ALE
" ===
"
" Jump to next and previous error
nmap <silent> <leader>nn :ALENext<cr>
nmap <silent> <leader>pp :ALEPrevious<cr>

" FZF
" ===

" Start FZF with CTRL-P
nmap <C-P> :FZF<CR>

" vim-test
" ========
"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Livedown
" ========
"
" Press gm to preview markdown file
map gm :LivedownPreview<CR>

" AG
" ==

" Search for word under cursor with ag
noremap <Leader>a :Ag <cword><cr>

" Search visual selection with ag
vnoremap <Leader>a y:Ag <C-r>=fnameescape(@")<CR><CR>

" Call Ag with ag
cabbrev ag Ag

" Eunuch
" ======

" Eunuch mappings
map <leader>m :Move %%

