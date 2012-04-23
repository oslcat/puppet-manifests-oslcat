node "carbon.osuosl.org" inherits desktop {
  include mythmon_gui

  # GUI Apps
  include dmenu

  include users::mythmon
  User <| $name == "mythmon" |> {
    groups +> ['http', 'games', 'video', 'optical', 'vboxusers', 'libvirt'],
  }
}
