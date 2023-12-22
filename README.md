# patnealcodes' dotfiles

## install some things:

- `tpm` tmux package manager
- `jq` for spotify in sketchybar
- `gh` and log in for the gh notifications in skethybar
- [https://github.com/arl/gitmux](gitmux)

## Set up ailiases you wanna

add the following to your `.zshrc`

```
if [ -f ~/.zshutils ]; then
    source ~/.zshutils
else
    print "404: ~/.zshutils not found."
fi
```

## Then symlink what you want from the repo to the respective folder. e.g.:

```
ln -s ~/Documents/repos/dotfiles/nvim ~/.config/nvim
ln -s ~/Documents/repos/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -s ~/Documents/repos/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Documents/repos/dotfiles/.zshutils ~/.zshutils
ln -s ~/Documents/repos/dotfiles/alacritty ~/.config/alacritty
```
