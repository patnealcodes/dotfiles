SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"
POPUP_SCRIPT="sketchybar -m --set \$NAME popup.drawing=toggle"

spotify_icon=(
  icon=:spotify:
	icon.padding_right=0
	icon.width=10
  icon.align=left
  icon.color=$GREEN
	icon.font="sketchybar-app-font:Regular:14.0"
	icon.icon_padding_right=0
)

sketchybar --add       event           spotify_change $SPOTIFY_EVENT      \
           --add       item            spotify.name right                 \
           --set       spotify.name    click_script="$POPUP_SCRIPT"       \
                                       popup.horizontal=on                \
                                       popup.align=left                   \
                                       icon.drawing=off                   \
                                                                          \
           --add item spotify_icon right         \
           --set spotify_icon "${spotify_icon[@]}"\
           --add       item            spotify.back popup.spotify.name    \
           --set       spotify.back    icon=↩                              \
                                       icon.padding_left=5                \
                                       icon.padding_right=5               \
                                       script="bash $PLUGIN_DIR/spotify.sh"    \
                                       label.drawing=off                  \
           --subscribe spotify.back    mouse.clicked                      \
                                                                          \
           --add       item            spotify.play popup.spotify.name    \
           --set       spotify.play    icon=⏯                            \
                                       icon.padding_left=5                \
                                       icon.padding_right=5               \
                                       updates=on                         \
                                       label.drawing=off                  \
                                       script="bash $PLUGIN_DIR/spotify.sh"    \
           --subscribe spotify.play    mouse.clicked spotify_change       \
                                                                          \
           --add       item            spotify.next popup.spotify.name    \
           --set       spotify.next    icon=↪                             \
                                       icon.padding_left=5                \
                                       icon.padding_right=10              \
                                       label.drawing=off                  \
                                       script="bash $PLUGIN_DIR/spotify.sh"    \
           --subscribe spotify.next    mouse.clicked                      \
                                                                          \
           --add       item            spotify.shuffle popup.spotify.name \
           --set       spotify.shuffle icon=☇                             \
                                       icon.highlight_color=0xff1DB954    \
                                       icon.padding_left=5                \
                                       icon.padding_right=5               \
                                       label.drawing=off                  \
                                       script="bash $PLUGIN_DIR/spotify.sh"    \
           --subscribe spotify.shuffle mouse.clicked                      \
                                                                          \
           --add       item            spotify.repeat popup.spotify.name  \
           --set       spotify.repeat  icon=∞                             \
                                       icon.highlight_color=0xff1DB954    \
                                       icon.padding_left=5                \
                                       icon.padding_right=5               \
                                       label.drawing=off                  \
                                       script="bash $PLUGIN_DIR/spotify.sh"    \
           --subscribe spotify.repeat  mouse.clicked


