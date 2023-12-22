show_git() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_test_icon" "")"
  local color="$(get_tmux_option "@catppuccin_test_color" "$thm_magenta")"
  local text="$(get_tmux_option "@catppuccin_test_text" "#(gitmux '#{pane_current_path}')")"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
