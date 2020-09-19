"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
source ~/.vim/plugins.vim
source ~/.vim/settings.vim
source ~/.vim/mappings.vim
source ~/.vim/autocommands.vim
