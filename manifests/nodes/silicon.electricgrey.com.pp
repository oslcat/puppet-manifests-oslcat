node "silicon.electricgrey.com" inherits server {
  # CLI Apps
  include lftp

  include users::mythmon
  User <| $title == "mythmon" |> {
    groups +> ['music'],
  }
}
