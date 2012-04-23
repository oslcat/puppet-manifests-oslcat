node "hafnium.electricgrey.com" inherits desktop {
  include mythmon_base

  # GUI Apps
  include dmenu

  include users::mythmon
  # Configs
  User <| title == "mythmon" |> {
    groups +> ['http', 'games', 'video', 'optical', 'vboxusers', 'disk', 'lp', 'storage', 'power'],
  }
}
