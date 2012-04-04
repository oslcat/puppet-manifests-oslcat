class xmonad {
  include xmonad::params

  package {
    "xmonad-core":
      name   => "${xmonad::params::package_xmonad_core}",
      ensure => latest;
    "xmonad-gnome":
      name   => "${xmonad::params::package_xmonad_gnome}",
      ensure => latest,
  }

  File <| tag == "xmonad" |>
}
