# patnealcodes' dotfiles

## install some things:

- `tpm` tmux package manager
- `mac-mouse-manager`
- `brew install pyenv`
- `brew install pyenv-virtualenv`
- `brew install xz`
- [https://github.com/arl/gitmux](gitmux)
- [Zed](https://zed.dev/)

## Set up ailiases you wanna
add the following to your `.zshrc`
```
if [ -f ~/.zshutils ]; then
    source ~/.zshutils
else
    print "404: ~/.zshutils not found."
fi
```
## Run some commands for setup
`defaults write .GlobalPreferences com.apple.scrollwheel.scaling -1`
- to disable the dumb scroll acceleration
`defaults write com.knollsoft.Hookshot screenEdgeGapTop -int 0`
- to change Rectangle top gap

## Create required folders
- `~/documents/tmux-rezzes`

## Then symlink what you want from the repo to the respective folder. e.g.:
```
ln -s ~/Documents/repos/dotfiles/nvim ~/.config/nvim
ln -s ~/Documents/repos/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Documents/repos/dotfiles/tmux_plugins/* ~/.tmux/plugins/tmux/custom/
ln -s ~/Documents/repos/dotfiles/.zshutils ~/.zshutils
ln -s ~/Documents/repos/dotfiles/alacritty ~/.config/alacritty
ln -s ~/Documents/repos/dotfiles/zed/* ~/.config/zed/
```
