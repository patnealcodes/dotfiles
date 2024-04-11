show_spotify() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_test_icon" "♫")"
  local color="$(get_tmux_option "@catppuccin_test_color" "$thm_green")"
  local text="$(get_tmux_option "@catppuccin_test_text" "#{music_status} #{artist}: #{track}")"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
