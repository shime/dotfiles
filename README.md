Configuration files for zsh, tmux, vim and others.

### Install

```bash
git clone git://github.com/shime/dotfiles.git ~/.dotfiles
./.dotfiles/dotify
```

The script will symlink all the doftiles to your `$HOME` dir.
If there are conflicts, the dotfiles from the home directory will be backuped to `~/.dotfiles_backup`


### Uninstall/restore backuped dotfiles

```bash
./.dotfiles/dotify uninstall
```

### Adding new dotfiles

- make a new directory inside the dotfiles dir: `~/.dotfiles/new_dir`
- place dotfiles or folders in `new_dir`. **ALL** the files/folders from `new_dir` will be symlinked to `$HOME` - weather they start with dot or not
- run dotify script `./.dotfiles/dotify`


### Symlink process

All of the files/directories from "first level" dirs get symlinked to `$HOME`.

```bash
~/.dotfiles/vim/.vimrc -> ~/.vimrc
~/.dotfiles/vim/.vim/ -> ~/.vim/      
~/.dotfiles/vim/new_dir/ -> ~/new_dir/
```

In the example above `~/.dotfiles/vim` and `~/.dotfiles/git` are "first level" dirs. Everything in them
gets symlinked.

### Thanks

Thanks to [Bruno](https://github.com/bruno-) for making the installation script and inspiring me for creating
my own dotfiles.
