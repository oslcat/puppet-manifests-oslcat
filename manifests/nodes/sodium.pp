node "sodium.electricgrey.com" inherits server {
  include mythmon_base

  include users::mythmon
  group { "users": ensure => present, }
  User <| $title == "mythmon" |> {
    groups +> ['music'],
  }
}
