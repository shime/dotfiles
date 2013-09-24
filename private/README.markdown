# Private dotfiles

Add git submodules to this folder. All submodules are initiated and updated with `dotify` script.
In private folder 'second tier' folders are symlinked to $HOME.

Example:
~/.dotfiles/private/ssh/.ssh/           # symlinked to $HOME
~/.dotfiles/private/README.markdown     # NOT symlinked to $HOME
