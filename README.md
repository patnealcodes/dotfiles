# patnealcodes' dotfiles

## install some tools/utils:

### Code stuff
  - [Neovim](https://neovim.io/doc/install/)
  - [Zed](https://zed.dev/)
### Apps
- Rectangle | *Mac window management*
  - [Download](https://rectangleapp.com/) 
### Homebrew packages
- mise | *like nvm, but for most things*
  - `brew install mise`
- Ghostty | *Terminal emulator of choice*
  - `brew install --cask ghostty`
- eza | *better `ls`*
  - `brew install eza`
- lazygit | *simple git TUI*
  - `brew install gitmux`
- tmux | *terminal multiplexer*
  - `brew install gitmux`
- gitmux | *git status in tmux*
  - `brew install gitmux`
- OpenCode | *Agent harness of choice*
  - `brew install anomalyco/tap/opencode`
- Starship | *Neat-o shell prompt*
  - `brew install starship`
- zsh-history-substring-search | *search history matching the current prompt*
  - `brew install zsh-history-substring-search`

### QoL
- Hex | *voice to text*
  - `brew install --cask kitlangton-hex`


___
## Configs
### Ezpz CLI to set up config file symlinks with `dotfiler`
```bash
npm run dotfiler
```

### Some configs need to be imported manually
- `./configs/RectangleProConfig.json`

___

## Include `zsh` utilities folder in `.zshrc`
```bash
if [ -f ~/.zshutils ]; then
source ~/.zshutils
```

___

## Some preference tweaks
```bash
defaults write .GlobalPreferences com.apple.scrollwheel.scaling -1
```
- to disable the dumb scroll acceleration

```bash
defaults write com.knollsoft.Hookshot screenEdgeGapTop -int 0
```
- to change Rectangle top gap
