node "silicon.electricgrey.com" inherits server {
  include mythmon_base

  include users::mythmon
  User <| $title == "mythmon" |> {
    groups +> ['music'],
  }
}
